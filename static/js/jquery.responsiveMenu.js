/*  Copyright 2013  Benoît Rouches  (email : benoitrouches@gmail.com)

 This program is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License, version 2, as
 published by the Free Software Foundation.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program; if not, write to the Free Software
 Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 */
(function ($) {
    $.fn.responsiveMenu = function (options) {

        var defaults = {
            slide: 'ul',
            action: 'tap, click',
            nomadDeviceScreenWidth: 568,
            duration: 400,
            triggerClassName: 'trigger',
            openClassName: 'open',
            title: '&nbsp;'
        };

        var options = $.extend(defaults, options);
        var currentObject = this;
        var state;

        this.prepend('<div class="' + options.triggerClassName + '">' + options.title + '</div>');

        var slide = this.find(options.slide);
        var trigger = this.find('.' + options.triggerClassName);

        if ((window.innerWidth
            || document.documentElement.clientWidth) > options.nomadDeviceScreenWidth) {
            trigger.hide();
            slide.show();
        } else {
            trigger.show();
            slide.hide();
        }

        trigger.bind(options.action, function (e) {

            //if('A' == this.tagName.toUpperCase())
            //e.preventDefault();

            slide.slideToggle(options.duration, function () {

                if ($(this).is(':visible')) {
                    currentObject.addClass(options.openClassName);
                    state = 'visible';
                } else {
                    currentObject.removeClass(options.openClassName);
                    state = 'hidden';
                }

            });
        });

        $(window).resize(function () {

            if ((window.innerWidth || document.documentElement.clientWidth) > options.nomadDeviceScreenWidth) {

                slide.show();
                trigger.hide();
                currentObject.removeClass(options.openClassName);

            } else {

                if (typeof state == 'undefined'
                    || state == 'hidden') {
                    slide.hide();
                } else {
                    slide.show();
                    currentObject.addClass(options.openClassName);
                }

                trigger.show();
            }
        });

        return this;
    };
})(jQuery);