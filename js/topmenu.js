
// 获得浏览器类型
function getBrowserType() {
    if (navigator.userAgent.indexOf("MSIE") > 0) return 1;
    if (isFirefox = navigator.userAgent.indexOf("Firefox") > 0) return 2;
    if (isSafari = navigator.userAgent.indexOf("Safari") > 0) return 3;
    if (isCamino = navigator.userAgent.indexOf("Camino") > 0) return 4;
    if (isMozilla = navigator.userAgent.indexOf("Gecko/") > 0) return 5;
    return 0;
}

//使得firefox兼容ie
if (getBrowserType() == 2) {
    window.constructor.prototype.__defineGetter__("event", function() {
        for (var o = arguments.callee.caller, e = null; o != null; o = o.caller) {
            e = o.arguments[0];
            if (e && (e instanceof Event))
                return e;
        }
        return null;
    });
    window.constructor.prototype.attachEvent = HTMLDocument.prototype.attachEvent = HTMLElement.prototype.attachEvent = function(e, f) {
        this.addEventListener(e.replace(/^on/i, ""), f, false);
    };
    window.constructor.prototype.detachEvent = HTMLDocument.prototype.detachEvent = HTMLElement.prototype.detachEvent = function(e, f) {
        this.removeEventListener(e.replace(/^on/i, ""), f, false);
    };

    with (window.Event.constructor.prototype) {
        __defineGetter__("srcElement", function() {
            return this.target;
        });
        __defineSetter__("returnValue", function(b) {
            if (!b) this.preventDefault();
        });
        __defineSetter__("cancelBubble", function(b) {
            if (b) this.stopPropagation();
        });
        __defineGetter__("fromElement", function() {
            var o = (this.type == "mouseover" && this.relatedTarget) || (this.type == "mouseout" && this.target) || null;
            if (o)
                while (o.nodeType != 1)
                o = o.parentNode;
            return o;
        });
        __defineGetter__("toElement", function() {
            var o = (this.type == "mouseover" && this.target) || (this.type == "mouseout" && this.relatedTarget) || null;
            if (o)
                while (o.nodeType != 1)
                o = o.parentNode;
            return o;
        });
        __defineGetter__("x", function() {
            return this.pageX;
        });
        __defineGetter__("y", function() {
            return this.pageY;
        });
        __defineGetter__("offsetX", function() {
            return this.layerX;
        });
        __defineGetter__("offsetY", function() {
            return this.layerY;
        });
    }
}


function getEvent() { //获取浏览器事件，同时兼容ie和ff的写法 
    if (document.all) return window.event;
    func = getEvent.caller;
    while (func != null) {
        var arg0 = func.arguments[0];
        if (arg0) {
            if ((arg0.constructor == Event || arg0.constructor == MouseEvent) || (typeof (arg0) == "object" && arg0.preventDefault && arg0.stopPropagation)) {
                return arg0;
            }
        }
        func = func.caller;
    }
    return null;
}

//菜单

var mmenus = new Array();
var misShow = new Boolean();
misShow = false;
var misdown = new Boolean();
misdown = false;
var mnumberofsub = 0;
var musestatus = true;
var mpopTimer = 0;
mmenucolor = 'white';
mfontcolor = '#737373';
mmenuoutcolor = 'white';
mmenuincolor = 'white';
mmenuoutbordercolor = 'white';
mmenuinbordercolor = 'white';
mmidoutcolor = '#737373';
mmidincolor = '#737373';
mmenuovercolor = 'cornflowerblue';
mitemedge = '0';
msubedge = '1';
mmenuunitwidth = 110;
mmenuitemwidth = 110;
mmenuheight = 30;
mmenuwidth = '100%';
mmenuadjust = 0;
mmenuadjustV = 0;
mfonts = '';
mcursor = 'hand';
var swipeSteps = 4;
var swipemsec = 25;
var swipeArray = new Array();
function swipe(el, dir, steps, msec) {
    if (steps == null) steps = swipeSteps;
    if (msec == null) msec = swipemsec;
    if (el.swipeIndex == null)
        el.swipeIndex = swipeArray.length;
    if (el.swipeTimer != null)
        window.clearTimeout(el.swipeTimer);
    swipeArray[el.swipeIndex] = el;
    el.style.clip = "rect(-99999, 99999, 99999, -99999)";
    if (el.swipeCounter == null || el.swipeCounter == 0) {
        el.orgLeft = el.offsetLeft;
        el.orgTop = el.offsetTop;
        el.orgWidth = el.offsetWidth;
        el.orgHeight = el.offsetHeight;
    }
    el.swipeCounter = steps;
    el.style.clip = "rect(0,0,0,0)";
    window.setTimeout("repeat(" + dir + "," + el.swipeIndex + "," + steps + "," + msec + ")", msec);
}
function repeat(dir, index, steps, msec) {
    el = swipeArray[index];
    var left = el.orgLeft;
    var top = el.orgTop;
    var width = el.orgWidth;
    var height = el.orgHeight;
    if (el.swipeCounter == 0) {
        el.style.clip = "rect(-99999, 99999, 99999, -99999)";
        return;
    }
    else {
        el.swipeCounter--;
        el.style.visibility = "visible";
        switch (dir) {
            case 2:
                el.style.clip = "rect(" + height * el.swipeCounter / steps + "," + width + "," + height + "," + 0 + ")";
                el.style.top = top - height * el.swipeCounter / steps;
                break;
            case 8:
                el.style.clip = "rect(" + 0 + "," + width + "," + height * (steps - el.swipeCounter) / steps + "," + 0 + ")";
                el.style.top = top + height * el.swipeCounter / steps;
                break;
            case 6:
                el.style.clip = "rect(" + 0 + "," + width + "," + height + "," + width * (el.swipeCounter) / steps + ")";
                el.style.left = left - width * el.swipeCounter / steps;
                break;
            case 4:
                el.style.clip = "rect(" + 0 + "," + width * (swipeSteps - el.swipeCounter) / steps + "," + height + "," + 0 + ")";
                el.style.left = left + width * el.swipeCounter / steps;
                break;
        }

        el.swipeTimer = window.setTimeout("repeat(" + dir + "," + index + "," + steps + "," + msec + ")", msec);
    }
}
var mtmpleft = "";
var mtmptop = "";
function hideSwipe(el) {
    window.clearTimeout(el.swipeTimer);
    el.style.visibility = "hidden";
    el.style.clip = "rect(-99999, 99999, 99999, -99999)";
    el.swipeCounter = 0;
    if (mtmpleft != "") el.style.left = mtmpleft;
    if (mtmptop != "") el.style.top = mtmptop;
}

function stoperror() {
    return true;
}
window.onerror = stoperror;
function mpopOut() {
    mpopTimer = setTimeout('mallhide()', 500);
}
function getReal(el, type, value) {
    temp = el;
    while ((temp != null) && (temp.tagName != "BODY")) {
        if (document.getElementById("temp." + type) == value) {
            el = temp;
            return el;
        }
        temp = temp.parentElement;
    }
    return el;
}


function mMenuRegister(menu) {
    mmenus[mmenus.length] = menu
    return (mmenus.length - 1)
}

function mMenuItem(caption, command, target, isline, statustxt, level, img, sizex, sizey, pos) {
    this.elements = new Array();
    this.caption = caption;
    this.command = command;
    this.target = target;
    this.isline = isline;
    this.statustxt = statustxt;
    if (level != null) {
        mnumberofsub++;
        this.hasc = mnumberofsub;
    }
    this.level = level;
    this.img = img;
    this.sizex = sizex;
    this.sizey = sizey;
    this.pos = pos;
}

function mMenu(caption, command, target, img, sizex, sizey, pos) {
    this.elements = new Array();
    this.caption = caption;
    this.command = command;
    this.target = target;
    this.img = img;
    this.sizex = sizex;
    this.sizey = sizey;
    this.pos = pos;
    this.id = mMenuRegister(this);
}
function mMenuAddItem(item) {
    this.elements[this.elements.length] = item
    item.parent = this.id;
    this.children = true;
}

mMenu.prototype.addItem = mMenuAddItem;
mMenuItem.prototype.addsubItem = mMenuAddItem;

function mtoout(src) {

    src.style.borderLeftColor = mmenuoutbordercolor;
    src.style.borderRightColor = mmenuinbordercolor;
    src.style.borderTopColor = mmenuoutbordercolor;
    src.style.borderBottomColor = mmenuinbordercolor;
    src.style.backgroundColor = mmenuoutcolor;
    src.style.color = mmenuovercolor;
}
function mtoin(src) {

    src.style.borderLeftColor = mmenuinbordercolor;
    src.style.borderRightColor = mmenuoutbordercolor;
    src.style.borderTopColor = mmenuinbordercolor;
    src.style.borderBottomColor = mmenuoutbordercolor;
    src.style.backgroundColor = mmenuincolor;
    src.style.color = mmenuovercolor;
}
function mnochange(src) {
    src.style.borderLeftColor = mmenucolor;
    src.style.borderRightColor = mmenucolor;
    src.style.borderTopColor = mmenucolor;
    src.style.borderBottomColor = mmenucolor;
    src.style.backgroundColor = '';
    src.style.color = mfontcolor;

}
function mallhide() {
    for (var nummenu = 0; nummenu < mmenus.length; nummenu++) {
        var themenu = document.all['mMenu' + nummenu]
        var themenudiv = document.all['mmenudiv' + nummenu]
        mnochange(themenu);
        mmenuhide(themenudiv);
    }
    for (nummenu = 1; nummenu <= mnumberofsub; nummenu++) {
        var thesub = document.all['msubmenudiv' + nummenu]
        msubmenuhide(thesub);
        mnochange(document.all['mp' + nummenu]);
        document.all["mitem" + nummenu].style.color = mfontcolor;
    }
}
function mmenuhide(menuid) {
    menuid.style.filter = 'Alpha(Opacity=100)';
    hideSwipe(menuid);
    misShow = false;
}
function msubmenuhide(menuid) {
    menuid.style.filter = 'Alpha(Opacity=100)';
    menuid.style.visibility = 'hidden';
}
function mmenushow(menuid, pid) {
    menuid.style.filter = 'Alpha(Opacity=100)';
    menuid.style.left = mposflag.offsetLeft + pid.offsetLeft + mmenuadjust; menuid.style.top = mposflag.offsetTop + mmenutable.offsetHeight + mmenuadjustV;
    if (mmenuitemwidth + parseInt(menuid.style.left) > document.body.clientWidth + document.body.scrollLeft)
        menuid.style.left = document.body.clientWidth + document.body.scrollLeft - mmenuitemwidth;
    mtmpleft = menuid.style.left; mtmptop = menuid.style.top; swipe(menuid, 2, 4);
    misShow = true;
}
function mshowsubmenu(menuid, pid, rid) {
    menuid.style.filter = 'Alpha(Opacity=100)';
    menuid.style.left = pid.offsetWidth + rid.offsetLeft;
    menuid.style.top = pid.offsetTop + rid.offsetTop - 3;
    if (mmenuitemwidth + parseInt(menuid.style.left) > document.body.clientWidth + document.body.scrollLeft)
        menuid.style.left = document.body.clientWidth + document.body.scrollLeft - mmenuitemwidth;
    menuid.style.visibility = 'visible';
}
function mmenu_over(menuid, x) {
    var evt = getEvent();
    var toElement = evt.toElement || evt.relatedTarget;
    var fromElement = evt.fromElement || evt.relatedTarget;

    toel = getReal(toElement, "className", "coolButton");
    fromel = getReal(fromElement, "className", "coolButton");
    if (toel == fromel) return;
    if (x < 0) {
        misShow = false;
        mallhide();
        mtoout(document.getElementById("mMenu" + x));
    } else {

        mallhide();
        mtoin(document.getElementById("mMenu" + x));
        mmenushow(menuid, document.getElementById("mMenu" + x));

    }
    clearTimeout(mpopTimer);
}
function mmenu_out(x) {
    var evt = getEvent();
    var toElement = evt.toElement || evt.relatedTarget;
    var fromElement = evt.fromElement || evt.relatedTarget;

    toel = getReal(toElement, "className", "coolButton");
    fromel = getReal(fromElement, "className", "coolButton");
    if (toel == fromel) return;
    if (misShow) {
        mtoin(document.getElementById("mMenu" + x));
    } else {
        mnochange(document.getElementById("mMenu" + x));
    }
    mpopOut()
}
function mmenu_down(menuid, x) {
    if (misShow) {
        mmenuhide(menuid);
        mtoout(document.getElementById("mMenu" + x));
    }
    else {
        mtoin(document.getElementById("mMenu" + x));
        mmenushow(menuid, document.getElementById("mMenu" + x));
        misdown = true;
    }
}
function mmenu_up() {
    misdown = false;
}
function mmenuitem_over(menuid, item, x, j, i) {
    var evt = getEvent();
    var toElement = evt.toElement || evt.relatedTarget;
    var fromElement = evt.fromElement || evt.relatedTarget;
    var srcElement = evt.srcElement || evt.target;

    toel = getReal(toElement, "className", "coolButton");
    fromel = getReal(fromElement, "className", "coolButton");
    if (toel == fromel) return;
    srcel = getReal(srcElement, "className", "coolButton");
    for (nummenu = 1; nummenu <= mnumberofsub; nummenu++) {
        var thesub = document.all['msubmenudiv' + nummenu]
        if (!(menuid == thesub || menuid.style.tag >= thesub.style.tag)) {
            msubmenuhide(thesub);
            mnochange(document.all['mp' + nummenu]);
            document.all["mitem" + nummenu].style.color = mfontcolor;
        }
    }
    if (item) document.all["mitem" + item].style.color = mmenuovercolor;
    if (misdown || item) {
        mtoin(srcel);
    }
    else {
        mtoout(srcel);
    }
    if (x == -1) mthestatus = document.getElementById("msub" + j).elements[i].statustxt;
    if (j == -1) mthestatus = mmenus[x].elements[i].statustxt;
    if (mthestatus != "") {
        musestatus = true;
        window.status = mthestatus;
    }
    clearTimeout(mpopTimer);
}
function mmenuitem_out(hassub) {
    var evt = getEvent();
    var toElement = evt.toElement || evt.relatedTarget;
    var fromElement = evt.fromElement || evt.relatedTarget;

    toel = getReal(toElement, "className", "coolButton");
    fromel = getReal(fromElement, "className", "coolButton");
    if (toel == fromel) return;
    srcel = getReal(evt.srcElement, "className", "coolButton");
    if (!hassub) mnochange(srcel);
    if (musestatus) window.status = "";
    mpopOut()
}
function mmenuitem_down() {
    var evt = getEvent();
    var srcElement = evt.srcElement || evt.target;


    srcel = getReal(srcElement, "className", "coolButton");
    mtoin(srcel)
    misdown = true;
}
function mmenuitem_up() {
    var evt = getEvent();
    var srcElement = evt.srcElement || evt.target;

    srcel = getReal(srcElement, "className", "coolButton");
    mtoout(srcel)
    misdown = false;
}
function mexec3(j, i) {
    var cmd;
    if (document.getElementById("msub" + j).elements[i].target == "blank") {
        cmd = "window.open('" + document.getElementById("msub" + j).elements[i].command + "')";
    } else {
        cmd = document.getElementById("msub" + j).elements[i].target + ".location=\"" + document.getElementById("msub" + j).elements[i].command + "\"";
    }
    eval(cmd);
}
function mexec2(x) {
    var cmd;
    if (mmenus[x].target == "blank") {
        cmd = "window.open('" + mmenus[x].command + "')";
    } else {
        cmd = mmenus[x].target + ".location=\"" + mmenus[x].command + "\"";
    }
    eval(cmd);
}
function mexec(x, i) {
    var cmd;
    if (mmenus[x].elements[i].target == "blank") {
        cmd = "window.open('" + mmenus[x].elements[i].command + "')";
    } else {
        cmd = mmenus[x].elements[i].target + ".location=\"" + mmenus[x].elements[i].command + "\"";
    }
    eval(cmd);
}
function mbody_click() {
    var evt = getEvent();
    var srcElement = evt.srcElement || evt.target;

    if (misShow) {
        srcel = getReal(srcElement, "className", "coolButton");
        for (var x = 0; x <= mmenus.length; x++) {
            if (srcel.id == "mMenu" + x)
                return;
        }
        for (x = 1; x <= mnumberofsub; x++) {
            if (srcel.id == "mp" + x)
                return;
        }
        mallhide();
    }
}
document.onclick = mbody_click;





function mwritetodocument() {
    var mwb = 1;
    var stringx = '<div id="mposflag" style="position:relative;"></div><table align="center"  id=mmenutable border=0 cellpadding=3 cellspacing=2 width=' + mmenuwidth + ' bgcolor=' + mmenucolor +
						' onselectstart="event.returnValue=false"' +
						' style="filter:Alpha(Opacity=80);cursor:' + mcursor + ';' + mfonts +
						' border-left: ' + mwb + 'px solid ' + mmenuoutbordercolor + ';' +
						' border-right: ' + mwb + 'px solid ' + mmenuinbordercolor + '; ' +
						'border-top: ' + mwb + 'px solid ' + mmenuoutbordercolor + '; ' +
						'border-bottom: ' + mwb + 'px solid ' + mmenuinbordercolor + '; padding:0px"><tr>'
    for (var x = 0; x < mmenus.length; x++) {
        var thismenu = mmenus[x];
        var imgsize = "";
        if (thismenu.sizex != "0" || thismenu.sizey != "0") imgsize = " width=" + thismenu.sizex + " height=" + thismenu.sizey;
        var ifspace = "";
        if (thismenu.caption != "") ifspace = "&nbsp;";
        stringx += "<td nowrap class=coolButton id=mMenu" + x + " style='border: " + mitemedge + "px solid " + mmenucolor +
                     		"' width=" + mmenuunitwidth + "px onmouseover=mmenu_over(mmenudiv" + x +
                     		"," + x + ") onmouseout=mmenu_out(" + x +
                     		") onmousedown=mmenu_down(mmenudiv" + x + "," + x + ")";
        if (thismenu.command != "") {
            stringx += " onmouseup=mmenu_up();mexec2(" + x + ");";
        } else {
            stringx += " onmouseup=mmenu_up()";
        }
        if (thismenu.pos == "0") {
            stringx += " align=center><img align=absmiddle src=\"" + thismenu.img + "\"" + ">" + ifspace + thismenu.caption + "</td>";
        } else if (thismenu.pos == "1") {
            stringx += " align=center>" + thismenu.caption + ifspace + "<img align=absmiddle src=\"" + thismenu.img + "\"" + "></td>";
        } else if (thismenu.pos == "2") {
            stringx += " align=center background='" + thismenu.img + "\">&nbsp;" + thismenu.caption + "&nbsp;</td>";
        } else {
            stringx += " align=center><img align=absmiddle src=\"" + thismenu.img + "\">&nbsp;" + thismenu.caption + "&nbsp;</td>";
        }
        stringx += "";
    }
    stringx += "<td width=*>&nbsp;</td></tr></table>";


    for (var x = 0; x < mmenus.length; x++) {
        thismenu = mmenus[x];
        if (x < 0) {
            stringx += '<div id=mmenudiv' + x + ' style="visiable:none"></div>';
        } else {
            stringx += '<div id=mmenudiv' + x +
							' style="filter:Alpha(Opacity=80);cursor:' + mcursor + ';position:absolute;' +
							'width:' + mmenuitemwidth + 'px; z-index:' + (x + 100);
            if (mmenuinbordercolor != mmenuoutbordercolor && msubedge == "0") {
                stringx += ';border-left: 1px solid ' + mmidoutcolor +
							';border-top: 1px solid ' + mmidoutcolor;
            }
            stringx += ';border-right: 1px solid ' + mmenuinbordercolor +
							';border-bottom: 1px solid ' + mmenuinbordercolor + ';visibility:hidden" onselectstart="event.returnValue=false">\n' +
                     		'<table  width="100%" border="0" height="100%" align="center" cellpadding="0" cellspacing="2" ' +
                     		'style="' + mfonts + ' border-left: 1px solid ' + mmenuoutbordercolor;
            if (mmenuinbordercolor != mmenuoutbordercolor && msubedge == "0") {
                stringx += ';border-right: 1px solid ' + mmidincolor +
                     		';border-bottom: 1px solid ' + mmidincolor;
            }
            stringx += ';border-top: 1px solid ' + mmenuoutbordercolor +
                     		';padding: 4px" bgcolor=' + mmenucolor + '>\n'
            for (var i = 0; i < thismenu.elements.length; i++) {
                var thismenuitem = thismenu.elements[i];
                var imgsize = "";
                if (thismenuitem.sizex != "0" || thismenuitem.sizey != "0") imgsize = " width=" + thismenuitem.sizex + " height=" + thismenuitem.sizey;
                var ifspace = "";
                if (thismenu.caption != "") ifspace = "&nbsp;";
                if (thismenuitem.hasc != null) {
                    stringx += "<tr><td id=mp" + thismenuitem.hasc + " class=coolButton style='border: " + mitemedge + "px solid " + mmenucolor +
                     			"' width=100% onmouseout=mmenuitem_out(true) onmouseover=\"mmenuitem_over(mmenudiv" + x +
                     			",'" + thismenuitem.hasc + "'," + x + ",-1," + i + ");mshowsubmenu(msubmenudiv" + thismenuitem.hasc + ",mp" + thismenuitem.hasc + ",mmenudiv" + x + ");\"" +
                     			"><table id=mitem" + thismenuitem.hasc + " cellspacing='0' cellpadding='0' border='0' width='100%' style='" + mfonts + "'><tr><td ";
                    if (thismenuitem.pos == "0") {
                        stringx += "><img align=absmiddle src=\"" + thismenuitem.img + "\"" + ">" + ifspace + thismenuitem.caption + "</td><td";
                    } else if (thismenuitem.pos == "1") {
                        stringx += ">" + thismenuitem.caption + ifspace + "<img align=absmiddle src=\"" + thismenuitem.img + "\"" + "></td><td";
                    } else if (thismenuitem.pos == "2") {
                        stringx += "background='" + thismenuitem.img + "\">" + thismenuitem.caption + "</td><td background='" + thismenuitem.img + "\"";
                    } else {
                        stringx += ">" + thismenuitem.caption + "</td><td";
                    }
                    stringx += " align=right width='1'>4</td></tr></table></td></tr>\n";
                } else if (!thismenuitem.isline) {
                    stringx += "<tr><td class=coolButton style='border: " + mitemedge + "px solid " + mmenucolor +
                     			"' width=100% height=15px onmouseover=\"mmenuitem_over(mmenudiv" + x +
                     			",false," + x + ",-1," + i + ");\" onmouseout=mmenuitem_out() onmousedown=mmenuitem_down() onmouseup=";
                    stringx += "mmenuitem_up();mexec(" + x + "," + i + "); ";
                    if (thismenuitem.pos == "0") {
                        stringx += "><img align=absmiddle src=\"" + thismenuitem.img + "\"" + ">" + ifspace + thismenuitem.caption + "</td></tr>";
                    } else if (thismenuitem.pos == "1") {
                        stringx += ">" + thismenuitem.caption + ifspace + "<img align=absmiddle src=\"" + thismenuitem.img + "\"" + "></td></tr>";
                    } else if (thismenuitem.pos == "2") {
                        stringx += "background='" + thismenuitem.img + "\">" + thismenuitem.caption + "</td></tr>";
                    } else {
                        stringx += ">" + thismenuitem.caption + "</td></tr>";
                    }
                } else {
                    stringx += '<tr><td height="1" background="/images/hr.gif" onmousemove="clearTimeout(mpopTimer);"><img height="1" width="1" src="none.gif" border="0"></td></tr>\n';
                }
            } stringx += '</table>\n</div>'
        }
    }

    for (var j = 1; j <= mnumberofsub; j++) {
        thisitem = document.getElementById("msub" + j);
        stringx += '<div id=msubmenudiv' + j +
							' style="filter:Alpha(Opacity=80);tag:' + thisitem.level + ';cursor:' + mcursor + ';position:absolute;' +
							'width:' + mmenuitemwidth + 'px; z-index:' + (j + 200);
        if (mmenuinbordercolor != mmenuoutbordercolor && msubedge == "0") {
            stringx += ';border-left: 1px solid ' + mmidoutcolor +
							';border-top: 1px solid ' + mmidoutcolor;
        }
        stringx += ';border-right: 1px solid ' + mmenuinbordercolor +
							';border-bottom: 1px solid ' + mmenuinbordercolor + ';visibility:hidden" onselectstart="event.returnValue=false">\n' +
                     		'<table  width="100%" border="0" height="100%" align="center" cellpadding="0" cellspacing="2" ' +
                     		'style="' + mfonts + ' border-left: 1px solid ' + mmenuoutbordercolor;
        if (mmenuinbordercolor != mmenuoutbordercolor && msubedge == "0") {
            stringx += ';border-right: 1px solid ' + mmidincolor +
                     		';border-bottom: 1px solid ' + mmidincolor;
        }
        stringx += ';border-top: 1px solid ' + mmenuoutbordercolor +
                     		';padding: 4px" bgcolor=' + mmenucolor + '>\n'
        for (var i = 0; i < thisitem.elements.length; i++) {
            var thismenuitem = thisitem.elements[i];
            var imgsize = "";
            if (thismenuitem.sizex != "0" || thismenuitem.sizey != "0") imgsize = " width=" + thismenuitem.sizex + " height=" + thismenuitem.sizey;
            var ifspace = "";
            if (thismenu.caption != "") ifspace = "&nbsp;";
            if (thismenuitem.hasc != null) {
                stringx += "<tr><td id=mp" + thismenuitem.hasc + " class=coolButton style='border: " + mitemedge + "px solid " + mmenucolor +
                     			"' width=100% onmouseout=mmenuitem_out(true) onmouseover=\"mmenuitem_over(msubmenudiv" + j +
                     			",'" + thismenuitem.hasc + "',-1," + j + "," + i + ");mshowsubmenu(msubmenudiv" + thismenuitem.hasc + ",mp" + thismenuitem.hasc + ",msubmenudiv" + j + ");\"" +
                     			"><table id=mitem" + thismenuitem.hasc + " cellspacing='0' cellpadding='0' border='0' width='100%' style='" + mfonts + "'><tr><td ";
                if (thismenuitem.pos == "0") {
                    stringx += "><img align=absmiddle src=\"" + thismenuitem.img + "\"" + ">" + ifspace + thismenuitem.caption + "</td><td";
                } else if (thismenuitem.pos == "1") {
                    stringx += ">" + thismenuitem.caption + ifspace + "<img align=absmiddle src=\"" + thismenuitem.img + "\"" + "></td><td";
                } else if (thismenuitem.pos == "2") {
                    stringx += "background='" + thismenuitem.img + "\">" + thismenuitem.caption + "</td><td background='" + thismenuitem.img + "\"";
                } else {
                    stringx += ">" + thismenuitem.caption + "</td><td";
                }
                stringx += " align=right width='1'>4</td></tr></table></td></tr>\n";
            } else if (!thismenuitem.isline) {
                stringx += "<tr><td class=coolButton style='border: " + mitemedge + "px solid " + mmenucolor +
                     			"' width=100% height=15px onmouseover=\"mmenuitem_over(msubmenudiv" + j +
                     			",false,-1," + j + "," + i + ");\" onmouseout=mmenuitem_out() onmousedown=mmenuitem_down() onmouseup=";
                stringx += "mmenuitem_up();mexec3(" + j + "," + i + "); ";
                if (thismenuitem.pos == "0") {
                    stringx += "><img align=absmiddle src=\"" + thismenuitem.img + "\"" + ">" + ifspace + thismenuitem.caption + "</td></tr>";
                } else if (thismenuitem.pos == "1") {
                    stringx += ">" + thismenuitem.caption + ifspace + "<img align=absmiddle src=\"" + thismenuitem.img + "\"" + "></td></tr>";
                } else if (thismenuitem.pos == "2") {
                    stringx += "background='" + thismenuitem.img + "\">" + thismenuitem.caption + "</td></tr>";
                } else {
                    stringx += ">" + thismenuitem.caption + "</td></tr>";
                }
            } else {
                stringx += '<tr><td height="1" background="/images/hr.gif" onmousemove="clearTimeout(mpopTimer);"><img height="1" width="1" src="none.gif" border="0"></td></tr>\n';
            }
        }
        stringx += '</table>\n</div>'
    }
    document.write("<div align='center' id='JsMenuCSS' class='JsMenuCSS'>" + stringx + "</div>");
}

	

