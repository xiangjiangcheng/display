    <%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>  
    <%  
    String path = request.getContextPath();  
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
    String paths=(String)request.getAttribute("swfpath");  
    %>  
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
    <html>  
    <head>  
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
    <title>te</title>  
      
    <style type="text/css" media="screen">     
                html, body  { height:100%; }    
                body { margin:0; padding:0; overflow:auto; }       
                #flashContent { display:none; }    
            </style>     
                
            <script type="text/javascript" src="<%=basePath %>js/swfobject/swfobject.js"></script>    
            <script type="text/javascript" src="<%=basePath %>js/flexpaper_flash.js"></script>    
            <script type="text/javascript">     
                //<!-- For version detection, set to min. required Flash Player version, or 0 (or 0.0.0), for no version detection. -->     
                var swfVersionStr = "10.0.0";    
                //<!-- To use express install, set to playerProductInstall.swf, otherwise the empty string. -->    
             /*    var xiSwfUrlStr = "playerProductInstall.swf"; */    
                var xiSwfUrlStr = "";  //值可以任意    
                    
                var flashvars = {     
                      SwfFile : escape("<%=basePath+paths%>"),   //swf文件路径（lucene4.6和页面同一个位置）       
                      Scale : 0.6,     
                      ZoomTransition : "easeOut",    
                      ZoomTime : 0.5,    
                      ZoomInterval : 0.1,    
                      FitPageOnLoad : false,    
                      FitWidthOnLoad : true,    
                      PrintEnabled : true,    
                      FullScreenAsMaxWindow : false,    
                      ProgressiveLoading : true,    
                          
                      PrintToolsVisible : true,    
                      ViewModeToolsVisible : true,    
                      ZoomToolsVisible : true,    
                      FullScreenVisible : true,    
                      NavToolsVisible : true,    
                      CursorToolsVisible : true,    
                      SearchToolsVisible : true,    
                          
                      localeChain: "en_US"    
                      };    
                          
                 var params = {    
                        
                    }    
                params.quality = "high";    
                params.bgcolor = "#ffffff";    
                params.allowscriptaccess = "sameDomain";    
                params.allowfullscreen = "true";    
                var attributes = {};    
                attributes.id = "FlexPaperViewer";    
                attributes.name = "FlexPaperViewer";    
                swfobject.embedSWF(    
                    "FlexPaperViewer.swf", "flashContent",     
                    "1024", "700",    
                    swfVersionStr, xiSwfUrlStr,     
                    flashvars, params, attributes);    
                swfobject.createCSS("#flashContent", "display:block;text-align:center;");    
            </script>     
              
    </head>  
    <body>  
      
    <div style="width: 100%;height: 90%; text-align: center;">    
                <div id="flashContent">     
               </div>     
            </div>    
      
    </body>  
    </html>  