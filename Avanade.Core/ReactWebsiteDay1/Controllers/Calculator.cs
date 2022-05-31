using Microsoft.AspNetCore.Mvc;
using ReactWebsite.Model;

namespace ReactWebsite.Controllers
{
    public class CalculatorController : Controller
    {
        [HttpGet]
        public JSONResponse Add(int left, int right)
        {
            return new JSONResponse
            {
                Value = left + right,
                Success = true,
                Error = null
            };
        }

        [HttpGet]
        public JSONResponse Substract(int left, int right)
        {
            if (left >= right)
            {
                return new JSONResponse
                {
                    Value = left - right,
                    Success = true,
                    Error = null
                };
            }
            else
            {
                return new JSONResponse
                {
                    Value = 0,
                    Success = false,
                    Error = $"Cannot substract {left} from {right} since the result would be a negative value"
                };
            }
        }

        [HttpGet]
        public JSONResponse Multiply(int left, int right)
        {
            return new JSONResponse
            {
                Value = left * right,
                Success = true,
                Error = null
            };
        }

        [HttpGet]
        public JSONResponse Divide(int left, int right)
        {
            string errorMessage = null;
            if (right == 0)
                errorMessage = "Aritmetic Error. The application cannot divide by 0";

            if (right > left)
                errorMessage = $"{left} cannot divide by {right}. Since the result would be a [0,1] decimal number";

            if (left % right != 0)
                errorMessage = $"{left} is not divisble by {right}. This calculator doesn't deal with decimals.";

            if (errorMessage != null)
                return new JSONResponse
                {
                    Success = false,
                    Error = errorMessage,
                };

            return new JSONResponse
            {
                Value = left / right,
                Success = true,
            };
        }
    }
}
