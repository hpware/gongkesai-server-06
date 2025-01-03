async function getMD() {
  try {
        const res = await fetch(url);
        const text = await res.text();
        document.getElementById("md").innerHTML = marked.parse(text);
      } catch (e) {
        document.getElementById("md").innerHTML = marked.parse("# Error");
      }
    }
    getMD();
