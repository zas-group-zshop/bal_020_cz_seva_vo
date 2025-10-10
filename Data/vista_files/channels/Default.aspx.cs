
using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Reflection;
using System.Collections.Specialized;
using System.Security.Cryptography;
using System.Text;
using System.Net;
using junaioAuthentication;

public partial class _Default : System.Web.UI.Page
{
    const double AUTH_DATE_TOLERANCE = 15; //15 minutes
    const string JUNAIO_KEY = "9f0a5259c6243a5bc19330ebaeab1c9b"; //Your API Key

    protected void Page_Load(object sender, EventArgs e)
    {
        JunaioAuthentication junAuthenticate = new JunaioAuthentication(AUTH_DATE_TOLERANCE, JUNAIO_KEY);
        
        if (!junAuthenticate.checkAuthentication())
        {
            Response.StatusCode = 401;
            Response.StatusDescription = "Unauthorized";
            Response.Flush();
            Response.Close();
        }
        //else
        
        string path = Request.PathInfo;
        string[] pathArray = path.Split('/');

        try
        {
            if (pathArray[1] == "pois")
            {
                switch (pathArray[2])
                {
                    case "search":
                        HttpContext.Current.Response.Write(poissearchRequest());
                        break;
                    case "event":
                        HttpContext.Current.Response.Write(poiseventRequest());
                        break;
                    default:
                        Response.StatusCode = 404;
                        Response.StatusDescription = "Not found";
                        Response.Flush();
                        Response.Close();
                        break;
                }
            }
            else if (pathArray[1] == "channels")
            {
                switch (pathArray[2])
                {
                    case "subscribe":
                        channelsubscribeRequest();
                        break;
                    default:
                        Response.StatusCode = 404;
                        Response.StatusDescription = "Not found";
                        Response.Flush();
                        Response.Close();
                        break;
                }
            }
            else
            {
                Response.StatusCode = 404;
                Response.StatusDescription = "Not found";
                Response.Flush();
                Response.Close();
            }
        }
        catch (Exception exceptions)
        {
            Response.StatusCode = 404;
            Response.StatusDescription = "Not found";
            Response.Flush();
            Response.Close();
        }               
    }

    private void channelsubscribeRequest()
    {
        //Avalilable Parameter
        //parameter["action"] ... subscribe or unsubscribe
        //parameter["uid"] ... unique user identification
        
        NameValueCollection parameter = Request.Params;
    }

    private string poiseventRequest()
    {
        //Avalilable Parameter
        //parameter["id"]...ID of the poi be interacted with
        //parameter["type"]...Type of interaction with the POI (click/text)
        //parameter["l"]...(optional) Position of the user when interacting with the POI
        //parameter["uid"]... Unique user identifier
               
        NameValueCollection parameter = Request.Params;

        string exampleOutput = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" +
                                "<results>" +
                                "<poi id=\"[poi_id:string]\" interactionfeedback=\"(none|click|text)\">" +
                                "<name><![CDATA[[name:string]]]></name>" +

                                "<description><![CDATA[[description:string]]]></description>" +

                                "<date>[placed_date:datetime]</date>" +

                                "<l>[latitude:float],[longitude:float],[altitude:float]</l>" +
                                "<o>[X:float],[Y:float],[Z:float]</o>" +

                                "<minaccuracy>[accuracy:int]</minaccuracy>" +
                                "<maxdistance>[maxdistance:int]</maxdistance>" +

                                "<mime-type>[mime-type:string]</mime-type>" +

                                "<mainresource>[model_uri:string]</mainresource>" +
                                "<thumbnail>[thumbnail_url:string]</thumbnail>" +
                                "<icon>[icon_url:string]</icon> " +

                                "<phone>[phonenumber:string]</phone>" +
                                "<mail>[email:string]</mail> " +
                                "<homepage>[homepage:url]</homepage>" +
                                "</poi>" +
                                "</results>";

        return exampleOutput;
        
    }

    private string poissearchRequest()
    {
        //Avalilable Parameter
        //parameter["l"]...(optional) Position of the user when interacting with the POI
        //parameter["p"]...(optional) perimeter of the data requested in meters.
        //parameter["uid"]... Unique user identifier
        //parameter["m"]... (optional) limit of to be returned values
        //parameter["page"]...page number of result. e.g. m = 10: page 1: 1-10; page 2: 11-20, e.g.
        
        NameValueCollection parameter = Request.Params;

        string exampleOutput = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" +
                        "<results>" +
                        "<poi id=\"[poi_id:string]\" interactionfeedback=\"(none|click|text)\">" +
                        "<name><![CDATA[[name:string]]]></name>" +

                        "<description><![CDATA[[description:string]]]></description>" +

                        "<date>[placed_date:datetime]</date>" +

                        "<l>[latitude:float],[longitude:float],[altitude:float]</l>" +
                        "<o>[X:float],[Y:float],[Z:float]</o>" +

                        "<minaccuracy>[accuracy:int]</minaccuracy>" +
                        "<maxdistance>[maxdistance:int]</maxdistance>" +

                        "<mime-type>[mime-type:string]</mime-type>" +

                        "<mainresource>[model_uri:string]</mainresource>" +
                        "<thumbnail>[thumbnail_url:string]</thumbnail>" +
                        "<icon>[icon_url:string]</icon> " +

                        "<phone>[phonenumber:string]</phone>" +
                        "<mail>[email:string]</mail> " +
                        "<homepage>[homepage:url]</homepage>" +
                        "</poi>" +
                        "</results>";

        return exampleOutput;        
    }    
}
