import { Fragment, useEffect, useState } from "react";
import { Container, Row, Col, Alert, Button } from "reactstrap";
import Common from "../../controls/Common";
import ProductsDataAPI from "./Shared/ProductsDataAPI";
import { Link } from "react-router-dom";

const ProductList = (props) => {

    const [products,setProducts] = useState([
        { productId: 11, name: 'soap', description: 'cleans everything', price: 100 },
        { productId: 22, name: 'tools', description: 'fix things up', price: 1000 },
        { productId: 333, name: 'hammer', description: 'good for the nails', price: 50 }
    ]);

    useEffect( () => {
        console.log(products);
    },[products]);

    return (
        <Container>
            <Row>
                <Col lg="10" className="text-center">
                    <Alert variant="success"><b>Products in Shop</b></Alert>
                </Col>
                <Col lg="2">
                    <Button color="primary" onClick={loadProducts}>Load Products</Button>
                </Col>
            </Row>

            <Row>
                {products.map((pr, i) => 
                    <Col lg="4" key={pr.productId}>
                        <Product product={pr} />
                    </Col>
                )}
            </Row>


        </Container>
    );
};
export default ProductList;

const Product = (props) => {

    const [product, setProduct] = useState(props.product);

    const divStyle = {
        border: '2px solid blue',
        margin: '2px'
    };

    return (
        <Container style={divStyle}>
            <Row>
                <Col>
                    <div>
                        Product #{product.productId}
                    </div>
                    <h4>{product.name}</h4>
                </Col>
            </Row>
            <Row>
                <Col>
                    {product.description}
                </Col>
            </Row>
            <Row>
                <Col lg="5">
                    <b>Created By</b>
                </Col>
                <Col lg="7">
                    {product.createdBy}
                </Col>
            </Row>
            <Row>
                <Col lg="5">
                    <b>Created Date</b>
                </Col>
                <Col lg="7">
                    {product.createdDate}
                </Col>
            </Row>
            <Row>
                <Col lg="6">
                    <Button color="danger" onClick={() => deleteProduct(product.productId)}>Delete</Button>
                </Col>
                <Col lg="6">
                    <Link to={`/Products/Edit/${product.productId}`}>Edit Product</Link>
                </Col>
            </Row>
        </Container>
    );
};
