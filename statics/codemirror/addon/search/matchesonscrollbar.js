(function(a){if(typeof exports=="object"&&typeof module=="object"){a(require("../../lib/codemirror"),require("./searchcursor"),require("../scroll/annotatescrollbar"))}else{if(typeof define=="function"&&define.amd){define(["../../lib/codemirror","./searchcursor","../scroll/annotatescrollbar"],a)}else{a(CodeMirror)}}})(function(b){b.defineExtension("showMatchesOnScrollbar",function(g,f,e){if(typeof e=="string"){e={className:e}}if(!e){e={}}return new c(this,g,f,e)});function c(e,j,i,h){this.cm=e;this.options=h;var f={listenForChanges:false};for(var k in h){f[k]=h[k]}if(!f.className){f.className="CodeMirror-search-match"}this.annotation=e.annotateScrollbar(f);this.query=j;this.caseFold=i;this.gap={from:e.firstLine(),to:e.lastLine()+1};this.matches=[];this.update=null;this.findMatches();this.annotation.update(this.matches);var g=this;e.on("change",this.changeHandler=function(l,m){g.onChange(m)})}var d=1000;c.prototype.findMatches=function(){if(!this.gap){return}for(var g=0;g<this.matches.length;g++){var f=this.matches[g];if(f.from.line>=this.gap.to){break}if(f.to.line>=this.gap.from){this.matches.splice(g--,1)}}var h=this.cm.getSearchCursor(this.query,b.Pos(this.gap.from,0),this.caseFold);var e=this.options&&this.options.maxMatches||d;while(h.findNext()){var f={from:h.from(),to:h.to()};if(f.from.line>=this.gap.to){break}this.matches.splice(g++,0,f);if(this.matches.length>e){break}}this.gap=null};function a(e,g,f){if(e<=g){return e}return Math.max(g,e+f)}c.prototype.onChange=function(k){var l=k.from.line;var e=b.changeEnd(k).line;var f=e-k.to.line;if(this.gap){this.gap.from=Math.min(a(this.gap.from,l,f),k.from.line);this.gap.to=Math.max(a(this.gap.to,l,f),k.from.line)}else{this.gap={from:k.from.line,to:e+1}}if(f){for(var h=0;h<this.matches.length;h++){var j=this.matches[h];var g=a(j.from.line,l,f);if(g!=j.from.line){j.from=b.Pos(g,j.from.ch)}var m=a(j.to.line,l,f);if(m!=j.to.line){j.to=b.Pos(m,j.to.ch)}}}clearTimeout(this.update);var n=this;this.update=setTimeout(function(){n.updateAfterChange()},250)};c.prototype.updateAfterChange=function(){this.findMatches();this.annotation.update(this.matches)};c.prototype.clear=function(){this.cm.off("change",this.changeHandler);this.annotation.clear()}});