import React from "react";

const HTMLToPDF = () => {
  const myHTML = `
    <body>
      <table border="1" style="border-collapse: collapse; width: 100%; text-align: left;">
        <tr>
          <th>Name</th>
          <th>Age</th>
        </tr>
        <tr>
          <td>Harry</td>
          <td>Smith</td>
        </tr>
      </table>
    </body>
  `;

  const downloadPDF = () => {
    // Create a new window
    const printWindow = window.open("", "_blank");
    
    if (!printWindow) {
      alert("Popup blocked. Please allow popups to download the file.");
      return;
    }
    
    // Write the HTML string into the new window
    printWindow.document.open();
    printWindow.document.write(`
      <html>
        <head>
          <title>PDF Document</title>
        </head>
        ${myHTML}
      </html>
    `);
    printWindow.document.close();

    // Trigger the print dialog
    printWindow.print();

    // Optionally close the window after printing
    printWindow.onafterprint = () => {
      printWindow.close();
    };
  };

  return (
    <div>
      <button onClick={downloadPDF}>Download PDF</button>
    </div>
  );
};

export default HTMLToPDF;
