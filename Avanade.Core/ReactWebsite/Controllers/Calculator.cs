using Microsoft.AspNetCore.Mvc;
using ReactWebsite.Model;

namespace ReactWebsite.Controllers
{
    public class CalculatorController : Controller
    {
        [HttpGet]
        public ApiResponse<int> Add(int left, int right)
        {
            return new ApiResponse<int>
            {
                Value = left + right,
                Success = true,
                Error = null
            };
        }

        [HttpGet]
        public ApiResponse<int> Substract(int left, int right)
        {
            if (left >= right)
            {
                return new ApiResponse<int>
                {
                    Value = left - right,
                    Success = true,
                    Error = null
                };
            }
            else
            {
                return new ApiResponse<int>
                {
                    Value = 0,
                    Success = false,
                    Error = $"Cannot substract {left} from {right} since the result would be a negative value"
                };
            }
        }

        [HttpGet]
        public ApiResponse<int> Multiply(int left, int right)
        {
            return new ApiResponse<int>
            {
                Value = left * right,
                Success = true,
                Error = null
            };
        }

        [HttpGet]
        public ApiResponse<int> Divide(int left, int right)
        {
            string errorMessage = null;
            if (right == 0)
                errorMessage = "Aritmetic Error. The application cannot divide by 0";

            if (right > left)
                errorMessage = $"{left} cannot divide by {right}. Since the result would be a [0,1] decimal number";

            if (left % right != 0)
                errorMessage = $"{left} is not divisble by {right}. This calculator doesn't deal with decimals.";

            if (errorMessage != null)
                return new ApiResponse<int>
                {
                    Success = false,
                    Error = errorMessage,
                };

            return new ApiResponse<int>
            {
                Value = left / right,
                Success = true,
            };
        }
    }
}
