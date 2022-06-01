import { Fragment, useEffect, useState } from "react";

const ProductList = (props) => {

    const products = [
        { id: 11, name: 'soap', description: 'cleans everything', price: 100 },
        { id: 22, name: 'tools', description: 'fix things up', price: 1000 },
        { id: 333, name: 'hammer', description: 'good for the nails', price: 50 }
    ];

    useEffect( () => {
        console.log(products);
    });

    return (
        <Fragment>
            <h1><b>This is the List of Products!!!!</b></h1>

            {products.map((pr, i) => 
                <div key={pr.id}>
                    <div> The Index in the collection is {i}</div>
                    <Productd product={pr} />
                </div>
            )}
        </Fragment>
    );
};
export default ProductList;

const Productd = (props) => {

    const [product, setProduct] = useState(props.product);

    const divStyle = {
        border: '2px solid blue',
    };

    return (
        <div style={divStyle}>
            <h3>{product.id} - {product.name}</h3>
            <p>{product.description}</p>
            <p>Costs AUD $ {product.price}</p>
        </div>
    );
};