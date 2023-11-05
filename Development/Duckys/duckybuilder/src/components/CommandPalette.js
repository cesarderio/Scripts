import React from 'react';
import { Button, Select, MenuItem } from '@mui/material';

const CommandPalette = ({ addCommand }) => {
    return (
        <div>
            <Select  defaultValue="STRING" id="commands">
                <MenuItem value="STRING">STRING</MenuItem>
                <MenuItem value="STRING">DELAY</MenuItem>
                {/* Add other command options here */}
            </Select>
            <Button variant="contained" color="primary" onClick={addCommand}>
                Add Command
            </Button>
        </div>
    );
};

export default CommandPalette;
