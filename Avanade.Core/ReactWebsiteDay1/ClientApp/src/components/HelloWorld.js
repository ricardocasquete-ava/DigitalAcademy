import { useState, Fragment } from "react";

const HelloWorld = (props) => {

    const [counter, setCounter] = useState(100);

    return (
        <Fragment>
            Counter value is {counter}
            <button onClick={ () => setCounter (counter +1)}>Increase Me !!!</button>
        </Fragment>
    );
};
export default HelloWorld;