import React, { Fragment, useState, useEffect } from 'react';

const Products = (props) => {

    const [productInStore, setProducts] = useState([]);
    useEffect(() => {

        const productsUri = 'https://localhost:5001/Sales';
        fetch(productsUri)
            .then((res) => res.json())
            .then((productList) => {
                setProducts(productList);
            });
    }, []);

    return (
            <Fragment>
                <h2> Products </h2>
                <table className="table table-bordered">
                    <thead>
                        <tr>
                            <th>name</th>
                            <th>description</th>
                            <th>price</th>
                        </tr>
                    </thead>
                <tbody>
                    {productInStore.map((product) => (
                        <tr key={product.id}>
                            <td>{product.name}</td>
                            <td>{product.description}</td>
                            <td>{product.price}</td>
                        </tr >
                    ))}
                    </tbody>
                </table>
            </Fragment>
    );
};
export default Products;
