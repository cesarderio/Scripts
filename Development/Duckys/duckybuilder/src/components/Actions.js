import React from 'react';
import { Button } from '@mui/material';

const Actions = ({ script, loadScript, saveScript }) => {
    return (
      <>
        <div>
          <Button variant="outlined" color="secondary">Preview Payload</Button>
          <Button variant="outlined" color="primary" onClick={saveScript}>
            Save
          </Button>
          <Button variant='outlined' onClick={loadScript}>
            Load
          </Button>
            {/* <Button variant="outlined" color="default" onClick={loadScript}>
                Load
              </Button> */}
        </div>
        {/* <div>
            <button>Preview Payload</button>
            <button onClick={saveScript}>Save</button>
            <button onClick={loadScript}>Load</button>
        </div> */}
      </>
    );
}

export default Actions;
