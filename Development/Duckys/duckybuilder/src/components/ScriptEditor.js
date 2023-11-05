import React from 'react';
import { TextareaAutosize } from '@mui/material';

const ScriptEditor = ({ script, setScript }) => {
    return (
        <div>
            <TextareaAutosize
                minRows={10}
                value={script}
                onChange={(e) => setScript(e.target.value)}
            />
        </div>
    );
};

export default ScriptEditor;
