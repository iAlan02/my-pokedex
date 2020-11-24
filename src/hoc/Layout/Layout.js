import { React, useState } from 'react'
import { Sidebar } from 'primereact/sidebar';
import { Button } from 'primereact/button';

function Layout(props) {
  const [visible, setVisible] = useState(false);
  console.log(props);
  return (
    <div>
      <Sidebar visible={visible} onHide={() => setVisible(false)}>
        Content
      </Sidebar>
      <Button icon="pi pi-arrow-right" onClick={(e) => setVisible(true)} />
      <div>
        {props.children}
      </div>
    </div>
  )
}

export default Layout;