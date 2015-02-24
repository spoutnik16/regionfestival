$(document).ready(function()
{
    var is_mobile = true;
    if ($("ul.mainmenu").css('display')=='none')
    {
        is_mobile=true;
    }


    if (is_mobile)
    {
        $("header").append('<div id="contentLayer" style="display:none; height: 100%; overflow-x: hidden; overflow-y: auto; position: absolute; right: 0; top: 0; width: 30%; z-index: 50"></div>');
        $("nav.mainmenu").click(function() 
        {  
            if ($("body").css('overflow')!='hidden')
            {openmenu();}
            else
            {
                if (("body").css('margin-left')=="70%")
                {closemenu();}
            }

        });

        
        
        function openmenu()
        {
            $("ul.mainmenu").toggle();
            $("body").css('min-height', $(window).height());
            var contentWidth = jQuery('body').width();
            $("body").css('width', contentWidth);
            $('#contentLayer').css("display", "block");
            $("body").animate({"marginLeft": ["70%", "easeOutExpo"]}, {duration: 700});
            $("body").css('overflow', 'hidden');        
            $("#contentLayer").click(function()
            {
                closemenu()
                            
            });
        };

        function closemenu()
        {
            $("ul.mainmenu").hide();
            $("body").unbind('touchmove');
            $("body").animate(
                {"marginLeft": ["0", "easeOutExpo"]}, 
                {duration: 700,
                complete: function()
                    {
                        $("body").css('width', "100%");
                        /*$("#contentLayer").css('display', 'none');*/
                        $("body").css('overflow', 'auto');
                    }
                }
            );
        }

    }
});

