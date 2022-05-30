import React, { Fragment } from 'react';
import { Container, Jumbotron, Row, Col, Image, Media } from 'reactstrap';

import avaLogo from './../resources/images/avaLogo.png';

const ProductResults = [{ id: 1, name: 'book', description: 'React Fundamentals', price: 50 }, { id: 2, name: 'laptop', description: 'Dell laptop', price: 2000 }]
const Products = (props) => {
    const productsList = ProductResults.map((product) => (
            <tr>
                <td>{product.name}</td>
                <td>{product.description}</td>
                <td>{product.price}</td>
            </tr >
    ))

    return (
        <Fragment>
            <h2> Products </h2>
            <table>
                <tr>
                    <th>name</th>
                    <th>description</th>
                    <th>price (AUD)</th>
                </tr>
                {productsList}
            </table>
        </Fragment>
    );
};
export default Products;