import React, { Fragment, useEffect } from 'react';

const Calculator = (props) => {

    const [counter, setCounter] = useEffect(0);

    return (
        <Fragment>
            <div>Counter Value is {counter}</div>
            <div><button>Increase counter</button></div>
        </Fragment>
    );
};
export default Calculator;