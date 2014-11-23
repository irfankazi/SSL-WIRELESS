using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;

namespace AutomaticBalanceUpdateApp2
{
    public class CookieAwareWebClient : WebClient
    {

        public CookieContainer CookieContainer { get; set; }

        public CookieAwareWebClient(): this(new CookieContainer())
        {
        }

        public CookieAwareWebClient(CookieContainer cookie)
        {
            this.CookieContainer = cookie;
        }

        protected override WebRequest GetWebRequest(Uri address)
        {
            WebRequest request = base.GetWebRequest(address);
            var castRequest = request as HttpWebRequest;
            if (castRequest != null)
            {
                castRequest.CookieContainer = this.CookieContainer;
            }

            return request;
        }
    
    }
}
