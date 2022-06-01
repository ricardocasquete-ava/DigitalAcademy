import { Fragment, useState } from "react";

const Counter = () => {

    const [counter, setCounter] = useState(1);

    const increaseCounter = () => {
        setCounter(counter * counter);
    }

    return (
        <Fragment>

            <div>I am a Counter and my Count is {counter}</div>

            <div><button onClick={() => setCounter(counter + 1)}>Increase the Counter </button></div>

            <div><button onClick={increaseCounter}>Multiply the Counter </button></div>

        </Fragment>
    );
};
export default Counter;