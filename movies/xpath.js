function runXPathQuery() {
    let query = document.getElementById("xpathQuery").value;
    if (!query) {
        document.getElementById("output").innerText = "Please enter an XPath query.";
        return;
    }

    let xhr = new XMLHttpRequest();
    xhr.open("GET", "movies.xml", true);
    xhr.responseType = "document";
    xhr.overrideMimeType("text/xml");
    
    xhr.onload = function () {
        if (xhr.status === 200) {
            let xmlDoc = xhr.responseXML;
            let result = xmlDoc.evaluate(query, xmlDoc, null, XPathResult.ANY_TYPE, null);
            let outputText = "";

            let node = result.iterateNext();
            while (node) {
                outputText += node.textContent + "\n";
                node = result.iterateNext();
            }

            document.getElementById("output").innerText = outputText || "No results found.";
        } else {
            document.getElementById("output").innerText = "Error loading XML file.";
        }
    };

    xhr.onerror = function () {
        document.getElementById("output").innerText = "Failed to load movies.xml.";
    };

    xhr.send();
}