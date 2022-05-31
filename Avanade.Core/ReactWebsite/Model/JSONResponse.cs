namespace ReactWebsite.Model
{
    /// <summary>
    /// Encapsulates a JSON Result / Response.
    /// </summary>
    public class JSONResponse
    {
        public object Value { get; set; }
        public bool Success { get; set; }
        public string Error { get; set; }   
    }
}
