!function(){var e,n,t;!function(o){function r(e,n){return x.call(e,n)}function i(e,n){var t,o,r,i,c,u,l,s,a,f,d,p,g=n&&n.split("/"),m=w.map,h=m&&m["*"]||{};if(e){for(e=e.split("/"),c=e.length-1,w.nodeIdCompat&&$.test(e[c])&&(e[c]=e[c].replace($,"")),"."===e[0].charAt(0)&&g&&(p=g.slice(0,g.length-1),e=p.concat(e)),a=0;a<e.length;a++)if(d=e[a],"."===d)e.splice(a,1),a-=1;else if(".."===d){if(0===a||1===a&&".."===e[2]||".."===e[a-1])continue;a>0&&(e.splice(a-1,2),a-=2)}e=e.join("/")}if((g||h)&&m){for(t=e.split("/"),a=t.length;a>0;a-=1){if(o=t.slice(0,a).join("/"),g)for(f=g.length;f>0;f-=1)if(r=m[g.slice(0,f).join("/")],r&&(r=r[o])){i=r,u=a;break}if(i)break;!l&&h&&h[o]&&(l=h[o],s=a)}!i&&l&&(i=l,u=s),i&&(t.splice(0,u,i),e=t.join("/"))}return e}function c(e,n){return function(){var t=b.call(arguments,0);return"string"!=typeof t[0]&&1===t.length&&t.push(null),p.apply(o,t.concat([e,n]))}}function u(e){return function(n){return i(n,e)}}function l(e){return function(n){h[e]=n}}function s(e){if(r(v,e)){var n=v[e];delete v[e],y[e]=!0,d.apply(o,n)}if(!r(h,e)&&!r(y,e))throw new Error("No "+e);return h[e]}function a(e){var n,t=e?e.indexOf("!"):-1;return t>-1&&(n=e.substring(0,t),e=e.substring(t+1,e.length)),[n,e]}function f(e){return function(){return w&&w.config&&w.config[e]||{}}}var d,p,g,m,h={},v={},w={},y={},x=Object.prototype.hasOwnProperty,b=[].slice,$=/\.js$/;g=function(e,n){var t,o=a(e),r=o[0];return e=o[1],r&&(r=i(r,n),t=s(r)),r?e=t&&t.normalize?t.normalize(e,u(n)):i(e,n):(e=i(e,n),o=a(e),r=o[0],e=o[1],r&&(t=s(r))),{f:r?r+"!"+e:e,n:e,pr:r,p:t}},m={require:function(e){return c(e)},exports:function(e){var n=h[e];return"undefined"!=typeof n?n:h[e]={}},module:function(e){return{id:e,uri:"",exports:h[e],config:f(e)}}},d=function(e,n,t,i){var u,a,f,d,p,w,x=[],b=typeof t;if(i=i||e,"undefined"===b||"function"===b){for(n=!n.length&&t.length?["require","exports","module"]:n,p=0;p<n.length;p+=1)if(d=g(n[p],i),a=d.f,"require"===a)x[p]=m.require(e);else if("exports"===a)x[p]=m.exports(e),w=!0;else if("module"===a)u=x[p]=m.module(e);else if(r(h,a)||r(v,a)||r(y,a))x[p]=s(a);else{if(!d.p)throw new Error(e+" missing "+a);d.p.load(d.n,c(i,!0),l(a),{}),x[p]=h[a]}f=t?t.apply(h[e],x):void 0,e&&(u&&u.exports!==o&&u.exports!==h[e]?h[e]=u.exports:f===o&&w||(h[e]=f))}else e&&(h[e]=t)},e=n=p=function(e,n,t,r,i){if("string"==typeof e)return m[e]?m[e](n):s(g(e,n).f);if(!e.splice){if(w=e,w.deps&&p(w.deps,w.callback),!n)return;n.splice?(e=n,n=t,t=null):e=o}return n=n||function(){},"function"==typeof t&&(t=r,r=i),r?d(o,e,n,t):setTimeout(function(){d(o,e,n,t)},4),p},p.config=function(e){return p(e)},e._defined=h,t=function(e,n,t){if("string"!=typeof e)throw new Error("See almond README: incorrect module build, no module name");n.splice||(t=n,n=[]),r(h,e)||r(v,e)||(v[e]=[e,n,t])},t.amd={jQuery:!0}}(),t("../bower_components/almond/almond",function(){}),function(){t("extra",[],function(){return"another script"})}.call(this),function(){t("main",["extra"],function(e){return console.log("Thiss Main and: "+e),$(".share").on("click",function(e){return $(this).parent().toggleClass("active")}),$(window).resize(function(){var e,n,t;if(e=$("#logo").text("BestNewsMedia"),n=$("#logo").text("BNM"),t=$(window).width(),console.log(t),t<640&&($("#logo").text("BNM"),console.log("small")),t>700)return $("#logo").text("BestNewsMedia"),console.log("large")}),$("#sliderBestMaterials").slick({slidesToShow:1,slidesToScroll:1,dots:!0,centerMode:!0,centerPadding:"160px",arrows:!1}),function(){var e,n,t,o,r,i,c,u,l,s,a,f,d,p,g,m;return e=document.body,o=document.querySelector(".content-wrap"),a=document.getElementById("open-button"),t=document.getElementById("close-button"),n=$(".content"),g=$(".cd-nav-trigger"),l=!1,s=document.getElementById("morph-shape"),p=Snap(s.querySelector("svg")),f=p.select("path"),c=f.attr("d"),d=s.getAttribute("data-morph-open"),u=!1,r=function(){return i()},i=function(){return a.addEventListener("click",m),t&&t.addEventListener("click",m),n.on("click",function(e){var n;if(n=e.target,l&&n!==a)return m()})},m=function(){return!u&&(u=!0,l?(a.className="cd-nav-trigger",e.className="",setTimeout(function(){f.attr("d",c),u=!1},300)):(e.className+="show-menu",a.className+=" nav-is-visible",f.animate({path:d},400,mina.easeinout,function(){u=!1})),l=!l)},r()}()})}.call(this),n(["main"])}();