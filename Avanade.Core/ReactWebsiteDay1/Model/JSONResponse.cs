namespace ReactWebsite.Model
{
    /// <summary>
    /// Encapsulates a JSON Result / Response.
    /// </summary>
    public class JSONResponse
    {
        public object Data { get; set; }
        public bool IsSuccessful { get; set; }
        public string Error { get; set; }   
    }
}
