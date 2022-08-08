//=================================================================================
// Constants

const mugen = {
    aspectRatio: { x:4, y:3 },//{ x:16, y:9 },
    width: 320,
    resolution: {
        get width() {
            return ( mugen.width / mugen.aspectRatio.x ) * mugen.aspectRatio.x;
        },
        get height() {
            return ( mugen.width / mugen.aspectRatio.x ) * mugen.aspectRatio.y;
        }
    }
};
//alert(mugen.resolution.width);

//=================================================================================
// Variables
var requestAnimFrame = ( function() {
    return window.requestAnimationFrame    ||
        window.webkitRequestAnimationFrame ||
        window.mozRequestAnimationFrame    ||
        window.oRequestAnimationFrame      ||
        window.msRequestAnimationFrame     ||
        function( callback ) {
            window.setTimeout( callback, 1000 / 60 );
        };
} )();

// Create the canvas
var canvas = document.getElementById('canvas'); //document.createElement( 'canvas' );
var ctx = canvas.getContext( '2d' );
var zoom = 1;

// The main game loop
var lastTime;
var fps;

var player1;
var player2;

var resources = [];
resources.push(new resource('chars', 'yagamiAKOF')); //kusanagi Another character
resources.push(new resource('chars', 'yagamiAKOF')); //
Promise.all(resources.map(function(resource) {
    return resource.load();
})).then(function() {
    init();
});

// Game state
var gameTime = 0;
var isGameOver;

// Stage image
var img = new Image();


//=================================================================================
// Functions

window.onload = window.onresize = function() {

    var content = document.getElementById('content');
    contentWidth = content.offsetWidth;
    contentHeight = content.offsetHeight;
    
    // cria a proporcao baseado na largura do elemento
    var sw = contentWidth / mugen.aspectRatio.x;
    var sh = sw * mugen.aspectRatio.y;
    
    zoom = contentWidth / mugen.resolution.width;
    
    if ( sh > contentHeight ) {
        //alert( 'sh é maior: ' + sh );
        zoom = contentHeight / mugen.resolution.height;
    }
    
    canvas.width = mugen.resolution.width * zoom;
    canvas.height = mugen.resolution.height * zoom;

    document.getElementById("content").appendChild( canvas ); //document.body.appendChild( canvas );
    
}
//---------------------------------------------------------------------------------
function main() {

    var now = Date.now();
    var dt = (now - lastTime) / 1000.0;
    fps = Math.ceil(1000 / (now - lastTime));
    update();
    render();

    lastTime = now;
    requestAnimFrame(main);

};
//---------------------------------------------------------------------------------
function init() {

    reset();
    lastTime = Date.now();
    main();

}
//---------------------------------------------------------------------------------
// Update game objects
function update( dt ) {

    //handleInput( dt );
    //checkCollisions();

};
//---------------------------------------------------------------------------------
function stage() {

    var n = 0;
    if (mugen.resolution.height == 180) { n = 1; }
    img.src = 'stages/img' + n + '.png';

    ctx.drawImage(img, 0, 0, mugen.resolution.width, mugen.resolution.height);

}
//---------------------------------------------------------------------------------
function debug() {

    var container = document.getElementById('container');
    containerWidth = container.offsetWidth;
    containerHeight = container.offsetHeight;
    
    var content = document.getElementById('content');
    contentWidth = content.offsetWidth;
    contentHeight = content.offsetHeight;
    
    var canvas = document.getElementById('canvas');
    canvasWidth = canvas.offsetWidth;
    canvasHeight = canvas.offsetHeight;
    
    var system = '[SYSTEM] FPS:' + fps + ' - memoria: ' + player1.action + ' - processamento: ' + player2.action;
    //var players = '[PLAYERS] player1.action: ' + player1.action + ' - player2.action: ' + player2.action;
    var players = '[PLAYERS] P1 action: ' + player1.action + ' - P2 action: ' + player2.action;
    var size = '[SIZE] page: ' + containerWidth + ',' + containerHeight + ' - div: ' + contentWidth + ',' + contentHeight + ' - canvas: ' + canvasWidth + ',' + canvasHeight;
    
    ctx.fillStyle = '#fff';
    ctx.font = '8px  Lucida Console';
    ctx.textBaseline = 'bottom';
    ctx.fillText( system, 10, 20 );
    ctx.fillText( players, 10, 40 );
    ctx.fillText( size, 10, 60 );

}
//---------------------------------------------------------------------------------
// Draw everything
function render() {

    ctx.clearRect( 0, 0, mugen.resolution.width, mugen.resolution.height );

    stage();

    // Player 1
    renderPlayer( player1 );
    renderPlayer( player2 );

    // Infos debug
    debug();

};
//---------------------------------------------------------------------------------
function renderPlayer( player ) {

    ctx.save();
    ctx.scale( player.right, 1 );

    var groupNumber = player.AIR[player.action].elements[player.currentFrame].groupNumber;
    var imageNumber = player.AIR[player.action].elements[player.currentFrame].imageNumber;
    var i = player.indexOf(groupNumber, imageNumber);

    var image = decodePCX( player.SFF.images[ i ].image, player.palette );
    var width = player.right === 1 ? 0 : image.width;

    var rect = {
        x: ( player.right * ( player.pos.x - player.SFF.images[ i ].x ) ) + ( player.right * width ),
        y: player.pos.y - player.SFF.images[ i ].y,
        width: image.width,
    	height: image.height
    };
    ctx.fillStyle = 'white';
    ctx.fillRect(rect.x, rect.y, rect.width, rect.height );
    
    // Fill image
    ctx.drawImage( image, ( player.right * ( player.pos.x - player.SFF.images[ i ].x ) ) + ( player.right * width ), player.pos.y - player.SFF.images[ i ].y );
    
    
    
    // Fill collision box // TODO Wrong in scale
    if ( player.AIR[ player.action ].clsn2Default ) {
    	var clsn = player.AIR[ action ].clsn2Default;
    }
    else if ( player.AIR[ player.action ].elements[ player.currentFrame ].clsn2 ) {
    	var clsn = player.AIR[ player.action ].elements[ player.currentFrame ].clsn2;
    }
    if ( clsn ) {
    	for ( i = 0; i < clsn.length; i++ ) {	
    		var x = player.pos.x + clsn[ i ].x;
    		var y = player.pos.y + clsn[ i ].y ;
    		var width = clsn[ i ].x2 - clsn[ i ].x;
    		var height = clsn[ i ].y2 - clsn[ i ].y;
    		ctx.strokeStyle  = 'rgba(0,255,0,1)';
    		ctx.strokeRect( player.right * x, y, player.right * width, height );
    	}
    }

    // Fill pos
    ctx.fillStyle = '#ff0000';
    ctx.fillRect( player.right * player.pos.x, player.pos.y, 1, 1 );
    


    player.currentTime++;
    if (player.currentTime >= player.AIR[player.action].elements[player.currentFrame].time) {
        player.currentTime = 0;
        player.currentFrame++;
        if (player.currentFrame >= player.AIR[player.action].elements.length) {
            player.currentFrame = 0;
        }
    }

    ctx.restore();

}
//---------------------------------------------------------------------------------
// Reset game to original state
function reset() {

    isGameOver = false;
    gameTime = 0;
    score = 0;

    ctx.scale(zoom || 1, zoom || 1);

    player1 = new player( resources[ 0 ] );
    player1.pos = {
        x: mugen.resolution.width / 2 - 90,
        y: mugen.resolution.height - 30
    };
    player1.palette = player1.SFF.palette; //player1..ACT[ 0 ];
    player1.right = 1;

    player2 = new player( resources[ 1 ] ); // Another character
    player2.pos = {
        x: mugen.resolution.width / 2 + 90,
        y: mugen.resolution.height - 30
    };
    player2.palette = player2.SFF.palette;
    player2.right = -1;

};
