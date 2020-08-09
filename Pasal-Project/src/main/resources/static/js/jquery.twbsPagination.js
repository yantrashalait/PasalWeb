/*
 * Custom pagination code
 */
$(document).ready(function(){
	 // For handling pagination no page parameter issue
	
	// Read url to check if page parameter exist already or not
	 function GetURLParameter(sParam){
        var sPageURL = window.location.search.substring(1);
        var sURLVariables = sPageURL.split('&');
        for (var i = 0; i < sURLVariables.length; i++)
        {
            var sParameterName = sURLVariables[i].split('=');
            if (sParameterName[0] == sParam)
            {
                return sParameterName[1];
            }
        }
      }
	 
	  //Checking if page paramter exist
      if (typeof GetURLParameter('page') === "undefined") {
    	// Checking if other url param exist or not
        if(document.location.href.includes('?')) {
          var url = document.location.href+"&page=1";
        }else{
          var url = document.location.href+"?page=1";
        }
        //window.location.href = url;
        /*
         * Changing page url
         * history.replaceState() operates exactly like history.pushState() except that replaceState() modifies the current history entry 
         * instead of creating a new one
         */ 
        history.replaceState(null, '', url);

      }
      
      // Fetching totalPages
	  let fetchTotalPages = $('#pagination').attr("data-total-pages");
      window.pagObj = $('#pagination').twbsPagination({
          totalPages: fetchTotalPages,
          visiblePages: 5,
          prev: '&laquo;',
          next: '&raquo;',
          href:true,
          pageVariable: 'page',
          onPageClick: function (event, page) {
              // console.info(page + ' (from options)');
          }
      }).on('page', function (event, page) {
          // console.info(page + ' (from event listening)');
      });
});

/*
 * jQuery Bootstrap Pagination v1.4.1
 * https://github.com/esimakin/twbs-pagination
 *
 * Copyright 2014-2016, Eugene Simakin <john-24@list.ru>
 * Released under Apache-2.0 license
 * http://apache.org/licenses/LICENSE-2.0.html
 */
!function(a,b,c,d){"use strict";var e=a.fn.twbsPagination,f=function(b,c){if(this.$element=a(b),this.options=a.extend({},a.fn.twbsPagination.defaults,c),this.options.startPage<1||this.options.startPage>this.options.totalPages)throw new Error("Start page option is incorrect");if(this.options.totalPages=parseInt(this.options.totalPages),isNaN(this.options.totalPages))throw new Error("Total pages option is not correct!");if(this.options.visiblePages=parseInt(this.options.visiblePages),isNaN(this.options.visiblePages))throw new Error("Visible pages option is not correct!");if(this.options.onPageClick instanceof Function&&this.$element.first().on("page",this.options.onPageClick),this.options.hideOnlyOnePage&&1==this.options.totalPages)return this.$element.trigger("page",1),this;this.options.totalPages<this.options.visiblePages&&(this.options.visiblePages=this.options.totalPages),this.options.href&&(this.options.startPage=this.getPageFromQueryString(),this.options.startPage||(this.options.startPage=1));var d="function"==typeof this.$element.prop?this.$element.prop("tagName"):this.$element.attr("tagName");return"UL"===d?this.$listContainer=this.$element:this.$listContainer=a("<ul></ul>"),this.$listContainer.addClass(this.options.paginationClass),"UL"!==d&&this.$element.append(this.$listContainer),this.options.initiateStartPageClick?this.show(this.options.startPage):(this.currentPage=this.options.startPage,this.render(this.getPages(this.options.startPage)),this.setupEvents()),this};f.prototype={constructor:f,destroy:function(){return this.$element.empty(),this.$element.removeData("twbs-pagination"),this.$element.off("page"),this},show:function(a){if(a<1||a>this.options.totalPages)throw new Error("Page is incorrect.");return this.currentPage=a,this.render(this.getPages(a)),this.setupEvents(),this.$element.trigger("page",a),this},enable:function(){this.show(this.currentPage)},disable:function(){var b=this;this.$listContainer.off("click").on("click","li",function(a){a.preventDefault()}),this.$listContainer.children().each(function(){var c=a(this);c.hasClass(b.options.activeClass)||a(this).addClass(b.options.disabledClass)})},buildListItems:function(a){var b=[];if(this.options.first&&b.push(this.buildItem("first",1)),this.options.prev){var c=a.currentPage>1?a.currentPage-1:this.options.loop?this.options.totalPages:1;b.push(this.buildItem("prev",c))}for(var d=0;d<a.numeric.length;d++)b.push(this.buildItem("page",a.numeric[d]));if(this.options.next){var e=a.currentPage<this.options.totalPages?a.currentPage+1:this.options.loop?1:this.options.totalPages;b.push(this.buildItem("next",e))}return this.options.last&&b.push(this.buildItem("last",this.options.totalPages)),b},buildItem:function(b,c){var d=a("<li></li>"),e=a("<a></a>"),f=this.options[b]?this.makeText(this.options[b],c):c;return d.addClass(this.options[b+"Class"]),d.data("page",c),d.data("page-type",b),d.append(e.attr("href",this.makeHref(c)).addClass(this.options.anchorClass).html(f)),d},getPages:function(a){var b=[],c=Math.floor(this.options.visiblePages/2),d=a-c+1-this.options.visiblePages%2,e=a+c;d<=0&&(d=1,e=this.options.visiblePages),e>this.options.totalPages&&(d=this.options.totalPages-this.options.visiblePages+1,e=this.options.totalPages);for(var f=d;f<=e;)b.push(f),f++;return{currentPage:a,numeric:b}},render:function(b){var c=this;this.$listContainer.children().remove();var d=this.buildListItems(b);a.each(d,function(a,b){c.$listContainer.append(b)}),this.$listContainer.children().each(function(){var d=a(this),e=d.data("page-type");switch(e){case"page":d.data("page")===b.currentPage&&d.addClass(c.options.activeClass);break;case"first":d.toggleClass(c.options.disabledClass,1===b.currentPage);break;case"last":d.toggleClass(c.options.disabledClass,b.currentPage===c.options.totalPages);break;case"prev":d.toggleClass(c.options.disabledClass,!c.options.loop&&1===b.currentPage);break;case"next":d.toggleClass(c.options.disabledClass,!c.options.loop&&b.currentPage===c.options.totalPages)}})},setupEvents:function(){var b=this;this.$listContainer.off("click").on("click","li",function(c){var d=a(this);return!d.hasClass(b.options.disabledClass)&&!d.hasClass(b.options.activeClass)&&(!b.options.href&&c.preventDefault(),void b.show(parseInt(d.data("page"))))})},makeHref:function(a){return this.options.href?this.generateQueryString(a):"#"},makeText:function(a,b){return a.replace(this.options.pageVariable,b).replace(this.options.totalPagesVariable,this.options.totalPages)},getPageFromQueryString:function(a){var b=this.getSearchString(a),c=new RegExp(this.options.pageVariable+"(=([^&#]*)|&|#|$)"),d=c.exec(b);return d&&d[2]?(d=decodeURIComponent(d[2]),d=parseInt(d),isNaN(d)?null:d):null},generateQueryString:function(a,b){var c=this.getSearchString(b),d=new RegExp(this.options.pageVariable+"=*[^&#]*");return c?"?"+c.replace(d,this.options.pageVariable+"="+a):""},getSearchString:function(a){var c=a||b.location.search;return""===c?null:(0===c.indexOf("?")&&(c=c.substr(1)),c)},getCurrentPage:function(){return this.currentPage}},a.fn.twbsPagination=function(b){var c,e=Array.prototype.slice.call(arguments,1),g=a(this),h=g.data("twbs-pagination"),i="object"==typeof b?b:{};return h||g.data("twbs-pagination",h=new f(this,i)),"string"==typeof b&&(c=h[b].apply(h,e)),c===d?g:c},a.fn.twbsPagination.defaults={totalPages:1,startPage:1,visiblePages:5,initiateStartPageClick:!0,hideOnlyOnePage:!1,href:!1,pageVariable:"{{page}}",totalPagesVariable:"{{total_pages}}",page:null,first:"First",prev:"Previous",next:"Next",last:"Last",loop:!1,onPageClick:null,paginationClass:"pagination",nextClass:"page-item next",prevClass:"page-item prev",lastClass:"page-item last",firstClass:"page-item first",pageClass:"page-item",activeClass:"active",disabledClass:"disabled",anchorClass:"page-link"},a.fn.twbsPagination.Constructor=f,a.fn.twbsPagination.noConflict=function(){return a.fn.twbsPagination=e,this},a.fn.twbsPagination.version="1.4.1"}(window.jQuery,window,document);