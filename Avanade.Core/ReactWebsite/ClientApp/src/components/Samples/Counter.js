import React, { Fragment, useState } from 'react';
import { Button } from 'reactstrap';

const Counter = () => {

    const [counter, setCounter] = useState(0);

    return (
        <Fragment>

            <div>
                Counter Value is {counter}
            </div>

            <div>
                <Button color="success" onClick={ () => setCounter ( counter +1) }>Increase counter</Button>
            </div>

        </Fragment>
    );
};
export default Counter;