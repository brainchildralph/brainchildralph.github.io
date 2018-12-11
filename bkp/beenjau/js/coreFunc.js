function loadTidTabByHtml(tab){
    for(var key in tab){
        $('[tid="'+key+'"]').html(tab[key]);
    }
}
function loadIdTabByTxt(tab){
    for(var key in tab){
        $('#'+key).text(tab[key]);
    }
}
function setCookieMin(name, value, min){
    var expire=new Date();
    expire.setTime(expire.getTime()+(min*60*1000));
    setCookie(name, value, expire);
}

function setCookie(name, value) {
    var argv = setCookie.arguments;
    var argc = setCookie.arguments.length;
    var expires = (argc > 2) ? argv[2] : null;
    var path = (argc > 3) ? argv[3] : null;
    var domain = (argc > 4) ? argv[4] : null;
    var secure = (argc > 5) ? argv[5] : null;
    document.cookie = escape(name) + "=" + escape(value) +
        ((expires == null) ? "" : ("; expires=" + expires.toGMTString())) +
        ((path == null) ? "" : ("; path=" + path)) +
        ((domain == null) ? "" : ("; domain=" + domain)) +
        ((secure == null) ? "" : ("; secure=" + secure));
}

function delCookie(name) {
    var expDate = new Date();
    expDate.setTime(expDate.getTime()-1);
    document.cookie = escape(name) + "=; expires=" + expDate.toGMTString();
}
function getCookie(name)
{
    var value = document.cookie;
    var start = value.indexOf(" " + name + "=");
    if (start == -1)
    {
        start = value.indexOf(name + "=");
    }
    if (start == -1)
    {
        value = null;
    }
    else
    {
        start = value.indexOf("=", start) + 1;
        var end = value.indexOf(";", start);
        if (end == -1)
        {
            end = value.length;
        }
        value = unescape(value.substring(start,end));
    }
    return value;
}
