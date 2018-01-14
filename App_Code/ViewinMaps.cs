using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

/// <summary>
/// Summary description for ViewinMaps
/// //I'm so good.
/// </summary>
public class ViewinMaps
{
    public static string loadMap (string Zipcode)
    {
        StringBuilder map = new StringBuilder();
        map.Append("https://www.google.com.sg/maps/place/Singapore+");
        map.Append(Zipcode);
        return map.ToString();
    }

}