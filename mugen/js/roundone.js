require = (function() {
    function r(e, n, t) {
        function o(i, f) {
            if (!n[i]) {
                if (!e[i]) {
                    var c = "function" == typeof require && require;
                    if (!f && c) return c(i, !0);
                    if (u) return u(i, !0);
                    var a = new Error("Cannot find module '" + i + "'");
                    throw a.code = "MODULE_NOT_FOUND", a
                }
                var p = n[i] = {
                    exports: {}
                };
                e[i][0].call(p.exports, function(r) {
                    var n = e[i][1][r];
                    return o(n || r)
                }, p, p.exports, r, e, n, t)
            }
            return n[i].exports
        }
        for (var u = "function" == typeof require && require, i = 0; i < t.length; i++) o(t[i]);
        return o
    }
    return r
})()({
    "actions": [function(require, module, exports) {
        "use strict";

        function createActionChangeState(t) {
            return function(e) {
                e.action !== t && (e.action = t, e.currentFrame = 0, e.currentTime = 0)
            }
        }
        module.exports = {
            createActionChangeState: createActionChangeState
        };

    }, {}],
    "app": [function(require, module, exports) {
        "use strict";
        var _createClass = function() {
            function e(e, t) {
                for (var i = 0; i < t.length; i++) {
                    var n = t[i];
                    n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                }
            }
            return function(t, i, n) {
                return i && e(t.prototype, i), n && e(t, n), t
            }
        }();

        function _classCallCheck(e, t) {
            if (!(e instanceof t)) throw new TypeError("Cannot call a class as a function")
        }
        var resource = require("resource"),
            requestAnimFrame = window.requestAnimationFrame || window.webkitRequestAnimationFrame || window.mozRequestAnimationFrame || window.oRequestAnimationFrame || window.msRequestAnimationFrame || function(e) {
                window.setTimeout(e, 1e3 / 60)
            },
            RoundOneJSApp = function() {
                function e(t, i, n, a, r) {
                    _classCallCheck(this, e), this.player1 = t, this.player2 = i, this.canvasWidth = n, this.canvasHeight = a, this.zoom = r
                }
                return _createClass(e, [{
                    key: "createCanvas",
                    value: function() {
                        var e = document.createElement("canvas");
                        return e.width = this.canvasWidth * this.zoom, e.height = this.canvasHeight * this.zoom, document.body.appendChild(e), e.getContext("2d")
                    }
                }, {
                    key: "main",
                    value: function() {
                        var e = Date.now();
                        this.lastTime;
                        this.fps = Math.ceil(1e3 / (e - this.lastTime)), this.update(), this.render(), this.lastTime = e, requestAnimFrame(this.main.bind(this))
                    }
                }, {
                    key: "init",
                    value: function() {
                        this.ctx = this.createCanvas(), this.reset(), this.lastTime = Date.now(), this.main()
                    }
                }, {
                    key: "update",
                    value: function(e) {}
                }, {
                    key: "render",
                    value: function() {
                        this.ctx.clearRect(0, 0, this.canvasWidth, this.canvasHeight), this.renderPlayer(this.player1), this.renderPlayer(this.player2);
                        var e = "FPS:" + this.fps + " - action:" + this.player1.action;
                        this.ctx.fillStyle = "#000", this.ctx.font = "10px  Lucida Console", this.ctx.textBaseline = "bottom", this.ctx.fillText(e, 10, 20)
                    }
                }, {
                    key: "renderPlayer",
                    value: function(e) {
                        this.ctx.save(), this.ctx.scale(e.right, 1);
                        var t = e.AIR[e.action].elements[e.currentFrame].groupNumber,
                            i = e.AIR[e.action].elements[e.currentFrame].imageNumber,
                            n = e.indexOf(t, i),
                            a = resource.decodePCX(e.SFF.images[n].image, e.palette),
                            r = 1 === e.right ? 0 : a.width;
                        this.ctx.drawImage(a, e.right * (e.pos.x - e.SFF.images[n].x) + e.right * r, e.pos.y - e.SFF.images[n].y), e.currentTime++, e.currentTime >= e.AIR[e.action].elements[e.currentFrame].time && (e.currentTime = 0, e.currentFrame++, e.currentFrame >= e.AIR[e.action].elements.length && (e.currentFrame = 0)), this.ctx.restore()
                    }
                }, {
                    key: "reset",
                    value: function() {
                        this.isGameOver = !1, this.gameTime = 0, this.score = 0, this.ctx.scale(this.zoom || 1, this.zoom || 1)
                    }
                }], [{
                    key: "loadCharacters",
                    value: function(e, t) {
                        for (var i = [], n = 0, a = e.length; n < a; n++) {
                            var r = e[n];
                            i.push(new resource.Resource(r.path, r.name))
                        }
                        Promise.all(i.map(function(e) {
                            return e.load()
                        })).then(function() {
                            t.call(this, i)
                        })
                    }
                }]), e
            }();
        module.exports = {
            RoundOneJSApp: RoundOneJSApp
        };

    }, {
        "resource": "resource"
    }],
    "character": [function(require, module, exports) {
        "use strict";
        var _createClass = function() {
            function t(t, n) {
                for (var e = 0; e < n.length; e++) {
                    var a = n[e];
                    a.enumerable = a.enumerable || !1, a.configurable = !0, "value" in a && (a.writable = !0), Object.defineProperty(t, a.key, a)
                }
            }
            return function(n, e, a) {
                return e && t(n.prototype, e), a && t(n, a), n
            }
        }();

        function _classCallCheck(t, n) {
            if (!(t instanceof n)) throw new TypeError("Cannot call a class as a function")
        }
        var actions = require("actions"),
            conditions = require("conditions"),
            Character = function() {
                function t(n) {
                    _classCallCheck(this, t), this.player = n, this.player.character = this;
                    var e = this.player.DEF.info.displayname;
                    0 === e.indexOf('"') && (this.name = e.substr(1, e.length - 2)), this.commands = [], this.statesEntries = []
                }
                return _createClass(t, [{
                    key: "addDefaultEntries",
                    value: function() {
                        this.commands.push(new Command("(Jump back (upwards))", "/UB", 1)), this.commands.push(new Command("(Jump forwards (upwards))", "/UF", 1)), this.commands.push(new Command("(Walking backwards)", "/B", 1)), this.commands.push(new Command("(Walking forwards)", "/F", 1)), this.commands.push(new Command("(Jump neutral (upwards))", "/U", 1)), this.commands.push(new Command("(Crouching)", "/D", 1)), this.commands.push(new Command("(Standing)", "", 1)), this.statesEntries.push(new StateEntry(actions.createActionChangeState(43), [conditions.createConditionCommandExecuted("(Jump back (upwards))")])), this.statesEntries.push(new StateEntry(actions.createActionChangeState(42), [conditions.createConditionCommandExecuted("(Jump forwards (upwards))")])), this.statesEntries.push(new StateEntry(actions.createActionChangeState(21), [conditions.createConditionCommandExecuted("(Walking backwards)")])), this.statesEntries.push(new StateEntry(actions.createActionChangeState(20), [conditions.createConditionCommandExecuted("(Walking forwards)")])), this.statesEntries.push(new StateEntry(actions.createActionChangeState(11), [conditions.createConditionCommandExecuted("(Crouching)")])), this.statesEntries.push(new StateEntry(actions.createActionChangeState(41), [conditions.createConditionCommandExecuted("(Jump neutral (upwards))")])), this.statesEntries.push(new StateEntry(actions.createActionChangeState(0), [conditions.createConditionCommandExecuted("(Standing)")]))
                    }
                }]), t
            }(),
            Command = function() {
                function t(n, e, a) {
                    _classCallCheck(this, t), this.name = n, this.command = t.parseCommand(e), this.time = a
                }
                return _createClass(t, null, [{
                    key: "parseCommand",
                    value: function(t) {
                        for (var n = [], e = t.replace(/;.*/, "").replace(/\s+/g, "").split(","), a = 0, s = e.length; a < s; a++) {
                            var i = e[a],
                                r = -1 !== i.indexOf("/"),
                                o = -1 !== i.indexOf("$"),
                                c = -1 !== i.indexOf(">"),
                                d = {
                                    active: -1 !== i.indexOf("~"),
                                    time: 0
                                },
                                u = i.match(/\~[0-9]+/);
                            null !== u && (d.time = parseInt(u[0].substr(1)));
                            var m = i.replace(/[\/\$\>]/g, "").replace(/\~([0-9]+)?/g, "").split("+");
                            n.push({
                                keys: m,
                                hold: r,
                                directionOnly: o,
                                release: d,
                                noOtherKeys: c
                            })
                        }
                        return n
                    }
                }]), t
            }(),
            StateEntry = function() {
                function t(n, e) {
                    _classCallCheck(this, t), this.action = n, this.conditions = e
                }
                return _createClass(t, [{
                    key: "execute",
                    value: function(t) {
                        for (var n = this.conditions, e = 0, a = n.length; e < a; e++) {
                            if (!(0, n[e])(t)) return !1
                        }
                        return this.action(t), !0
                    }
                }]), t
            }();
        module.exports = {
            Character: Character,
            Command: Command,
            StateEntry: StateEntry
        };

    }, {
        "actions": "actions",
        "conditions": "conditions"
    }],
    "conditions": [function(require, module, exports) {
        "use strict";

        function createConditionCommandExecuted(n) {
            return function(e) {
                for (var t = e.character.commands, o = e.control.pressedButtons, r = null, d = 0, a = t.length; d < a; d++) {
                    var c = t[d];
                    c.name === n && (r = c)
                }
                if (r.command.length > o.length) return !1;
                for (var m = 0, u = r.command.length; m < u; m++) {
                    var l = r.command[m],
                        i = o[o.length - 1 - m];
                    if (!(l.hold === i.hold || l.hold && i.currentHold) || l.keys[0] !== i.buttons[0] && "" !== l.keys[0]) return !1
                }
                return !0
            }
        }
        module.exports = {
            createConditionCommandExecuted: createConditionCommandExecuted
        };

    }, {}],
    "control": [function(require, module, exports) {
        "use strict";
        var _createClass = function() {
            function e(e, t) {
                for (var n = 0; n < t.length; n++) {
                    var r = t[n];
                    r.enumerable = r.enumerable || !1, r.configurable = !0, "value" in r && (r.writable = !0), Object.defineProperty(e, r.key, r)
                }
            }
            return function(t, n, r) {
                return n && e(t.prototype, n), r && e(t, r), t
            }
        }();

        function _classCallCheck(e, t) {
            if (!(e instanceof t)) throw new TypeError("Cannot call a class as a function")
        }
        var Control = function() {
            function e(t, n) {
                _classCallCheck(this, e), this.player = t, this.player.control = this, this.keyMaps = n, this.pressedButtons = [], this.player.buttonPressed = function() {
                    for (var e = t.character, n = 0, r = e.statesEntries.length; n < r; n++) {
                        if (e.statesEntries[n].execute(t)) break
                    }
                }
            }
            return _createClass(e, [{
                key: "convertEventKeyInButton",
                value: function(e) {
                    var t = this.keyMaps[e];
                    return void 0 === t ? null : t
                }
            }, {
                key: "keyEvent",
                value: function(e) {
                    var t = this.convertEventKeyInButton(e.key);
                    null !== t && ("keydown" === e.type ? this.buttonDown(t) : "keyup" === e.type && this.buttonUp(t))
                }
            }, {
                key: "buttonDown",
                value: function(t) {
                    var n = new Date,
                        r = void 0,
                        s = void 0;
                    null === (r = this.pressedButtons.length > 0 ? this.pressedButtons[this.pressedButtons.length - 1] : null) || null !== r.dateReleased || e.calculateTrick(n, r.dateDown) > 0 && -1 === r.buttons.indexOf(t) ? (null != r && e.calculateTrick(n, r.dateDown) > 0 && (r.hold = !0), s = {
                        buttons: [],
                        dateDown: n,
                        dateReleased: null,
                        currentHold: !0,
                        hold: !1,
                        release: {
                            active: !1,
                            time: 0
                        }
                    }, this.pressedButtons.push(s)) : s = r, e.addButton(s.buttons, t), player.buttonPressed()
                }
            }, {
                key: "buttonUp",
                value: function(t) {
                    for (var n = new Date, r = this.pressedButtons.length - 1; r >= 0; r--) {
                        var s = this.pressedButtons[r];
                        if (-1 !== s.buttons.indexOf(t)) {
                            s.dateReleased = n, s.release.active = !0, s.release.time = e.calculateTrick(n, s.dateDown), s.currentHold = !1;
                            break
                        }
                    }
                    player.buttonPressed()
                }
            }], [{
                key: "calculateTrick",
                value: function(e, t) {
                    return Math.floor((e.getTime() - t.getTime()) / 60)
                }
            }, {
                key: "addButton",
                value: function(e, t) {
                    if (-1 === e.indexOf(t)) {
                        if (-1 !== ["U", "B", "D", "F"].indexOf(t) && 1 === e.length && -1 === ["a", "b", "c", "x", "y", "z"].indexOf(e[0])) return void("U" === t && "B" === e[0] || "B" === t && "U" === e[0] ? e[0] = "UB" : "U" === t && "F" === e[0] || "F" === t && "U" === e[0] ? e[0] = "UF" : "D" === t && "B" === e[0] || "B" === t && "D" === e[0] ? e[0] = "DB" : ("D" === t && "F" === e[0] || "F" === t && "D" === e[0]) && (e[0] = "DF"));
                        e.push(t)
                    }
                }
            }]), e
        }();
        module.exports = {
            Control: Control
        };

    }, {}],
    "player": [function(require, module, exports) {
        "use strict";
        var _typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function(e) {
                return typeof e
            } : function(e) {
                return e && "function" == typeof Symbol && e.constructor === Symbol && e !== Symbol.prototype ? "symbol" : typeof e
            },
            _createClass = function() {
                function e(e, t) {
                    for (var r = 0; r < t.length; r++) {
                        var n = t[r];
                        n.enumerable = n.enumerable || !1, n.configurable = !0, "value" in n && (n.writable = !0), Object.defineProperty(e, n.key, n)
                    }
                }
                return function(t, r, n) {
                    return r && e(t.prototype, r), n && e(t, n), t
                }
            }();

        function _classCallCheck(e, t) {
            if (!(e instanceof t)) throw new TypeError("Cannot call a class as a function")
        }
        var Player = function() {
            function e(t) {
                _classCallCheck(this, e), this.pos = {
                    x: 0,
                    y: 0
                }, this.action = 0, this.currentFrame = 0, this.currentTime = 0, this.right = 1, this.palette = null;
                var r = Object.prototype.hasOwnProperty;
                if ("object" != (void 0 === t ? "undefined" : _typeof(t))) throw TypeError("player - ressource incorrect");
                var n = Object(t);
                for (var o in n) r.call(n, o) && (this[o] = n[o])
            }
            return _createClass(e, [{
                key: "indexOf",
                value: function(e, t) {
                    if (null == this.SFF) throw new TypeError("indexOf - SFF not defined.");
                    for (var r = 0; r < this.SFF.images.length; r++)
                        if (this.SFF.images[r].groupNumber === e && this.SFF.images[r].imageNumber === t) return r;
                    return -1
                }
            }]), e
        }();
        module.exports = {
            Player: Player
        };

    }, {}],
    "resource": [function(require, module, exports) {
        "use strict";
        var _createClass = function() {
            function e(e, t) {
                for (var n = 0; n < t.length; n++) {
                    var i = t[n];
                    i.enumerable = i.enumerable || !1, i.configurable = !0, "value" in i && (i.writable = !0), Object.defineProperty(e, i.key, i)
                }
            }
            return function(t, n, i) {
                return n && e(t.prototype, n), i && e(t, i), t
            }
        }();

        function _classCallCheck(e, t) {
            if (!(e instanceof t)) throw new TypeError("Cannot call a class as a function")
        }

        function imageDataToImage(e, t) {
            var n = document.createElement("canvas");
            if (n.width = e.width, n.height = e.height, n.getContext("2d").putImageData(e, 0, 0), void 0 === t) return n;
            if ("flipH" == t) {
                var i = document.createElement("canvas");
                i.width = e.width, i.height = e.height;
                var a = i.getContext("2d");
                return a.scale(-1, 1), a.drawImage(n, -e.width, 0), i
            }
        }

        function decodePalette(e) {
            for (var t = [], n = new DataView(e), i = 0, a = 0; a < 256; a++) {
                var r = [];
                r[0] = n.getUint8(i, !0), i += 1, r[1] = n.getUint8(i, !0), i += 1, r[2] = n.getUint8(i, !0), i += 1, t.push(r)
            }
            return t
        }

        function decodeACT(e) {
            for (var t = [], n = new DataView(e), i = 0, a = 0; a < 256; a++) {
                var r = [];
                r[0] = n.getUint8(i, !0), i += 1, r[1] = n.getUint8(i, !0), i += 1, r[2] = n.getUint8(i, !0), i += 1, t.unshift(r)
            }
            return t
        }

        function decodePCX(e, t) {
            var n, i, a = {},
                r = new DataView(e),
                s = 0;
            for (a.id = r.getUint8(s, !0), s += 1, a.version = r.getUint8(s, !0), s += 1, a.encoding = r.getUint8(s, !0), s += 1, a.bitPerPixel = r.getUint8(s, !0), s += 1, a.x = r.getUint16(s, !0), s += 2, a.y = r.getUint16(s, !0), s += 2, a.width = r.getUint16(s, !0), s += 2, a.height = r.getUint16(s, !0), s += 2, a.hres = r.getUint16(s, !0), s += 2, a.vres = r.getUint16(s, !0), s += 2, a.colorMap = [], n = 0; n < 16; n++)(i = [])[0] = r.getUint8(s, !0), s += 1, i[1] = r.getUint8(s, !0), s += 1, i[2] = r.getUint8(s, !0), s += 1, a.colorMap.push(i);
            if (a.reserved = r.getUint8(s, !0), s += 1, a.nbPlanes = r.getUint8(s, !0), s += 1, a.bpl = r.getUint16(s, !0), s += 2, a.paletteInfo = r.getUint16(s, !0), s += 2, a.palette = [], void 0 === t)
                for (s = e.byteLength - 769, a.signature = r.getUint8(s, !0), s += 1, n = 0; n < 256; n++)(i = [])[0] = r.getUint8(s, !0), s += 1, i[1] = r.getUint8(s, !0), s += 1, i[2] = r.getUint8(s, !0), s += 1, a.palette.push(i);
            else a.palette = t;
            s = 128;
            var o = a.x,
                l = a.y;
            a.width++, a.height++;
            var c = new Uint8ClampedArray(a.width * a.height * 4);
            for (n = 0; n < a.width * a.height * 4;) c[n++] = 0;
            for (; l < a.height;) {
                var u, g, h = r.getUint8(s, !0);
                for (s += 1, 192 == (192 & h) ? (u = 63 & h, g = r.getUint8(s, !0), s += 1) : (u = 1, g = h), n = 0; n < u; n++) {
                    if (0 != g) {
                        var f = 4 * (o + l * a.width);
                        c[f + 0] = a.palette[g][0], c[f + 1] = a.palette[g][1], c[f + 2] = a.palette[g][2], c[f + 3] = 255
                    }++o >= a.width && (l++, o = a.x)
                }
            }
            var d = document.createElement("canvas");
            d.width = a.width, d.height = a.height;
            var p = d.getContext("2d"),
                m = p.createImageData(a.width, a.height);
            return m.data.set(c), p.putImageData(m, 0, 0), d
        }

        function decodeSFF(e) {
            var t = {},
                n = new DataView(e),
                i = 0;
            t.signature = n.getString(i, 12), i += 12, t.version = n.getString(i, 4), i += 4, t.nbGroups = n.getUint32(i, !0), i += 4, t.nbImages = n.getUint32(i, !0), i += 4, t.posFirstSubFile = n.getUint32(i, !0), i += 4, t.length = n.getUint32(i, !0), i += 4, t.paletteType = n.getUint8(i, !0), i += 1, t.blank = n.getString(i, 3), i += 3, t.comments = n.getString(i, 476), i += 476, t.SF = [];
            var a = 0;
            for (t.posFirstSubFile; a < t.nbImages;) {
                var r = {},
                    s = n.getUint32(i, !0);
                i += 4;
                n.getUint32(i, !0);
                i += 4, r.x = n.getUint16(i, !0), i += 2, r.y = n.getUint16(i, !0), i += 2, r.groupNumber = n.getUint16(i, !0), i += 2, r.imageNumber = n.getUint16(i, !0), i += 2, r.indexPreviousCopy = n.getUint16(i, !0), i += 2, r.samePalette = n.getUint8(i, !0), i += 1;
                n.getString(i, 14);
                i += 14, 0 == r.indexPreviousCopy && (r.samePalette, r.image = n.extractBuffer(i, s)), 0 == a && (t.palette = decodePalette(n.extractBuffer(s - 767, s))), i = s, t.SF.push(r), a++
            }
            return {
                images: t.SF,
                palette: t.palette
            }
        }

        function decodeAIR(e) {
            var t, n = {
                    action: /^\[Begin Action\s*(\d*)\s*\]$/,
                    clsn2Default: /^Clsn2Default\s*:\s*(\d*)$/,
                    clsn1: /^\Clsn1\s*:\s*(\d*)$/,
                    clsn2: /^\Clsn2\s*:\s*(\d*)$/,
                    clsn: new RegExp("^Clsn(\\d)\\[\\s*(\\d*)\\s*\\]\\s*\\=\\s*(-?\\d*?)\\s*,\\s*(-?\\d*?)\\s*,\\s*(-?\\d*?)\\s*,\\s*(-?\\d*?)$"),
                    element: /^(-?\d*)\s*,\s*(\d*)\s*,\s*(-?\d*)\s*,\s*(-?\d*)\s*,\s*(-?\d*)$/
                },
                i = [],
                a = e.split(/\r\n|\r|\n/),
                r = null,
                s = null,
                o = null;
            return a.forEach(function(e) {
                if (e = e.replace(/^\s+/, "").replace(/;.*/, "").replace(/\s+$/, ""), n.action.test(e)) t = e.match(n.action), r = t[1], null, s = null, o = null, i[r] = {};
                else if (n.clsn2Default.test(e)) r && (i[r].clsn2Default = []);
                else if (n.clsn1.test(e)) r && (s = []);
                else if (n.clsn2.test(e)) r && (o = []);
                else if (n.clsn.test(e)) {
                    if (t = e.match(n.clsn), r) {
                        var a = {
                            x: +t[3],
                            y: +t[4],
                            x2: +t[5],
                            y2: +t[6]
                        };
                        i[r].clsn2Default ? i[r].clsn2Default.push(a) : s ? s.push(a) : o && o.push(a)
                    }
                } else if (n.element.test(e)) {
                    var l = {
                        groupNumber: +(t = e.match(n.element))[1],
                        imageNumber: +t[2],
                        x: +t[3],
                        y: +t[4],
                        time: +t[5]
                    };
                    s && (l.clsn1 = s), o && (l.clsn2 = o), i[r].elements || (i[r].elements = []), i[r].elements.push(l)
                } else 0 != e.length && console.log("AIR - Line unknown : " + e)
            }), i
        }

        function decodeDEF(e) {
            var t, n = {
                    section: /^\[\s*([^\]]*)\s*\]$/,
                    param: /^([\w\.\-\_]+)\s*=\s*(.*?)$/
                },
                i = {},
                a = e.split(/\r\n|\r|\n/),
                r = null;
            return a.forEach(function(e) {
                e = e.replace(/^\s+/, "").replace(/;.*/, "").replace(/\s+$/, ""), n.section.test(e) ? (t = e.match(n.section), r = t[1].toLowerCase(), i[r] = {}) : n.param.test(e) ? (t = e.match(n.param), r ? i[r][t[1].toLowerCase()] = t[2] : i[t[1].toLowerCase()] = t[2]) : 0 != e.length && console.log("DEF - Line unknown : " + e)
            }), i
        }
        DataView.prototype.getString = function(e, t) {
            for (var n, i = "", a = 0; a < t && 0 !== (n = this.getUint8(a + e)); a++) i += String.fromCharCode(n);
            return i
        }, DataView.prototype.extractBuffer = function(e, t) {
            return this.buffer.slice(e - 1, t)
        };
        var Resource = function() {
            function e(t, n) {
                _classCallCheck(this, e), this.path = t, this.name = n, this.DEF = {}, this.AIR = [], this.SFF = {}, this.ACT = []
            }
            return _createClass(e, [{
                key: "load",
                value: function() {
                    var e = this;
                    return new Promise(function(t, n) {
                        fetch(e.path + "/" + e.name + "/" + e.name + ".def").then(function(e) {
                            return e.text()
                        }).then(function(e) {
                            return decodeDEF(e)
                        }).then(function(n) {
                            e.DEF = n;
                            var i = new Promise(function(t, i) {
                                    fetch(e.path + "/" + e.name + "/" + n.files.anim).then(function(e) {
                                        return e.text()
                                    }).then(function(n) {
                                        e.AIR = decodeAIR(n), t()
                                    })
                                }),
                                a = new Promise(function(t, i) {
                                    fetch(e.path + "/" + e.name + "/" + n.files.sprite).then(function(e) {
                                        return e.arrayBuffer()
                                    }).then(function(n) {
                                        e.SFF = decodeSFF(n), t()
                                    })
                                }),
                                r = new Promise(function(t, i) {
                                    fetch(e.path + "/" + e.name + "/" + n.files.pal1).then(function(e) {
                                        return e.arrayBuffer()
                                    }).then(function(n) {
                                        e.ACT.push(decodeACT(n)), t()
                                    })
                                });
                            Promise.all([i, a, r]).then(function() {
                                t()
                            })
                        })
                    })
                }
            }]), e
        }();
        module.exports = {
            decodePCX: decodePCX,
            Resource: Resource
        };

    }, {}]
}, {}, ["player", "resource", "app", "actions", "character", "conditions", "control"]);
