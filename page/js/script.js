["load", "resize"].forEach(function(evt) {
    window.addEventListener(evt, function() {
        dView();
        resizeContent();
    });
});

window.addEventListener('orientationchange', function() {
    location.reload();
});


const container = document.querySelector('.container');
const contents = document.querySelector('.contents');
const spaces = document.querySelectorAll('.space');
const header = document.querySelector('.header');
const navbar = document.querySelector('.navbar');

const items = document.querySelectorAll('.navbar-item');
const indicator = document.querySelector('.navbar-indicator');

const bodyAspectRatio = document.body.clientWidth / document.body.clientHeight;
const containerAspectRatio = container.clientWidth / container.clientHeight;

/*=================================================================*/

function info() {

    alert(`width: ${document.body.clientWidth} - Height: ${document.body.clientHeight}`);

}

function ResizeFont() {

    const divsize = document.querySelector('.panel-title').clientHeight;
    const font = document.querySelector('.panel-fontsize');

    if (font) {

        const fontHeight = font.clientHeight;
        var fontSize = window.getComputedStyle(font).fontSize;
        fontSize = parseInt(fontSize, 10);

        increasefactor = divsize / fontHeight;
        resizeFont = Math.floor(increasefactor * fontSize);
        document.body.style.fontSize = `${resizeFont/2.5}px`;
        //alert(`div: ${divsize} - fontHeight: ${fontHeight} - fontSize: ${fontSize} - resizeFont: ${resizeFont}`);
        font.remove();

    }
}

function resizePanel(panelWidth) {

    const panels = document.querySelectorAll('.panel');

    panels.forEach(panel => {

        const containerWidth = container.clientWidth;
        panel.style.width = panelWidth + 'px';

        const margin = (containerWidth - panelWidth) / 2;

        panel.style.margin = 'auto ' + margin + 'px';

    });

}

function resizeContent() {

    if (bodyAspectRatio >= containerAspectRatio) {

        const width = document.body.clientHeight * containerAspectRatio;

        container.style.width = width + 'px';
        container.style.height = document.body.clientHeight + 'px';

    } else {

        const containerAspectRatio = container.clientHeight / container.clientWidth;
        const height = document.body.clientWidth * containerAspectRatio;

        container.style.width = document.body.clientWidth + 'px';
        container.style.height = height + 'px';

    }

    // pega os valores iniciais baseado na proporcao, antes de ajustar o container ao tamanho do body
    navWidth = navbar.clientWidth;
    navHeight = navbar.clientHeight;
    spaceHeight = document.querySelector('.space').clientHeight;
    panelWidth = document.querySelector('.panel').clientWidth;

    // ajusta o container ao tamanho do body
    container.style.width = document.body.clientWidth + 'px';
    container.style.height = document.body.clientHeight + 'px';

    // para manter a proporcao redefine os valores apos o container ser ajustado ao body
    navbar.style.width = navWidth + 'px';
    navbar.style.height = navHeight + 'px';
    //indicator.style.width = items[0].clientWidth + 'px';
    spaces.forEach(space => {
        space.style.height = spaceHeight + 'px';
    });
    resizePanel(panelWidth);

    header.style.height = navbar.clientHeight / 3 + 'px';
    contents.style.height = document.body.clientHeight - navbar.clientHeight + 'px';

    ResizeFont();
}
resizeContent();

contents.onscroll = () => {

    if (contents.scrollTop > 5) {

        header.style = "background-color: #2D447C; box-shadow: 0px 0px 0.6vmin 0.3vmin black; backdrop-filter: blur(10px);";
        header.style.height = navbar.clientHeight + 'px';

    } else {

        header.style = "background-color: 'transparent'; box-shadow: 0px 0px 0px 0px black; backdrop-filter: blur(0px);";
        header.style.height = navbar.clientHeight / 3 + 'px';

    }

}

function handleIndicator(el) {

    items.forEach(item => {
        item.classList.remove('is-active');
    });

    indicator.style.width = el.offsetWidth + 'px';
    indicator.style.left = el.offsetLeft + 'px';
    indicator.style.backgroundColor = 'white';

    el.classList.add('is-active');

}

function dView() {

    const currentHash = window.location.hash;

    if (currentHash === "") {
        items[0].classList.add('is-active');
    } else {
        if (currentHash === "#arceus") {
            items[0].classList.add('is-active');
        }
        if (currentHash === "#typeweek") {
            items[1].classList.add('is-active');
        }
        if (currentHash === "#proposal") {
            items[2].classList.add('is-active');
        }
        if (currentHash === "#contact") {
            items[3].classList.add('is-active');
        }
        window.location = currentHash;
    }

    items.forEach(item => {
        item.addEventListener('click', e => { handleIndicator(e.currentTarget); });
        item.classList.contains('is-active') && handleIndicator(item);
    });

}