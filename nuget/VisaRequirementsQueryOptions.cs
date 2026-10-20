using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.VisaRequirements
{
    /// <summary>
    /// Query options for the Visa Requirements API
    /// </summary>
    public class VisaRequirementsQueryOptions
    {
        /// <summary>
        /// The passport's country: a two-letter ISO code such as US, or an English name such as United States
        /// </summary>
        [JsonProperty("passport")]
        public string Passport { get; set; }

        /// <summary>
        /// The destination country or territory: a two-letter ISO code such as JP, or an English name such as Japan
        /// </summary>
        [JsonProperty("destination")]
        public string Destination { get; set; }
    }
}
