// src/App.js

import React, { useState } from 'react';
import CommandPalette from './components/CommandPalette';
import ScriptEditor from './components/ScriptEditor';
import Actions from './components/Actions';

function App() {
   const [script, setScript] = useState('');

   const addCommand = () => {
       const command = document.getElementById('commands').value;
       setScript(prevScript => prevScript + command + '\n');
   };

   const saveScript = () => {
       localStorage.setItem('savedScript', script);
       alert('Script saved!');
   };

   const loadScript = () => {
       const savedScript = localStorage.getItem('savedScript');
       if (savedScript) {
           setScript(savedScript);
       } else {
           alert('No saved script found!');
       }
   };

   return (
       <div className="App">
           <CommandPalette addCommand={addCommand} />
           <ScriptEditor script={script} setScript={setScript} />
           <Actions script={script} loadScript={loadScript} saveScript={saveScript} />
       </div>
   );
}

export default App;
