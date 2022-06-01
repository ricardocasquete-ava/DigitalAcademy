import { useState } from "react";
import { Link } from "react-router-dom";
import { Container, Row, Col, Alert, Button } from "reactstrap";
import Common from "../../controls/Common";
import ProductsDataAPI from "./Shared/ProductsDataAPI";

const ProductAddNew = (props) => {

    const [productId, setProductId] = useState(0);
    const [name, setName] = useState('');
    const [description, setDescription] = useState('');
    const [price, setPrice] = useState(0);

    const handleProductIdChange = e => {
        setProductId(parseInt(e.target.value));
    };

    const handleNameChange = e => {
        setName(e.target.value);
    };

    const handleDescriptionChange = e => {
        setDescription(e.target.value);
    };

    const handlePriceChange = e => {
        setPrice(parseInt(e.target.value));
    };

    const saveChanges = () => {
        let model = {
            productId: productId,
            name: name,
            description: description,
            price: price
        };

        ProductsDataAPI.addNew(model, saveChangesCallback);
    };

    const saveChangesCallback = (data) => {
        Common.log("Record Inserted");
    }

    return (
        <Container>
            <Row>
                <Col lg="10" className="text-center">
                    <Alert variant="success"><b>Add New Product</b></Alert>
                </Col>
                <Col lg="2">
                    <Link to="/Products/All">Back to All Products</Link>
                </Col>
            </Row>

            <Row>
                <Col lg="4">
                    Product #
                </Col>
                <Col lg="8">
                    <input type="text" value={productId} onChange={handleProductIdChange}/>
                </Col>
            </Row>

            <Row>
                <Col lg="4">
                    Name
                </Col>
                <Col lg="8">
                    <input type="text" value={name} onChange={handleNameChange} />
                </Col>
            </Row>

            <Row>
                <Col lg="4">
                    Description
                </Col>
                <Col lg="8">
                    <input type="text" value={description} onChange={handleDescriptionChange} />
                </Col>
            </Row>

            <Row>
                <Col lg="4">
                    Price
                </Col>
                <Col lg="8">
                    <input type="text" value={price} onChange={handlePriceChange} />
                </Col>
            </Row>

            <Row>
                <Col lg="6">
                    <Button color="success" onClick={saveChanges}>Save Changes</Button>
                </Col>
            </Row>
        </Container>
    );
};
export default ProductAddNew;
