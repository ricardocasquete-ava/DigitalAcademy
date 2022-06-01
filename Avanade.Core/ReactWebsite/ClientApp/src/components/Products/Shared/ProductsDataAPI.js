import Common from "../../../controls/Common";

const ProductsDataAPI = {

    getAll: async function (inputParameter, callbackMethod, callbackData, callbackErrorMethod) {
        Common.call("API/Products/GetAll", inputParameter, callbackMethod, callbackData, callbackErrorMethod);
    },

    addNew: async function (inputParameter, callbackMethod, callbackData, callbackErrorMethod) {
        Common.call("API/Products/AddNew", inputParameter, callbackMethod, callbackData, callbackErrorMethod);
    },

    delete: async function (inputParameter, callbackMethod, callbackData, callbackErrorMethod) {
        Common.call("API/Products/Delete", inputParameter, callbackMethod, callbackData, callbackErrorMethod);
    }

};

export default ProductsDataAPI;