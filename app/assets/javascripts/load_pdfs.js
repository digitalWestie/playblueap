//
// Fetch the PDF document from the URL using promises
//
PDFJS.getDocument('assets/profilo.pdf').then(function(pdf) {
  // Using promise to fetch the page
  pdf.getPage(41).then(function(page) {
    var scale = 1.5;
    var viewport = page.getViewport(scale);

    // Prepare canvas using PDF page dimensions
    var canvas = document.getElementById('health_canvas');
    var context = canvas.getContext('2d');
    canvas.height = viewport.height;
    canvas.width = viewport.width;

    // Render PDF page into canvas context
    var renderContext = { canvasContext: context, viewport: viewport };
    page.render(renderContext);
  });

  pdf.getPage(29).then(function(page) {
    var scale = 1.5;
    var viewport = page.getViewport(scale);

    // Prepare canvas using PDF page dimensions
    var canvas = document.getElementById('city_canvas');
    var context = canvas.getContext('2d');
    canvas.height = viewport.height;
    canvas.width = viewport.width;

    // Render PDF page into canvas context
    var renderContext = { canvasContext: context, viewport: viewport };
    page.render(renderContext);
  });

  pdf.getPage(62).then(function(page) {
    var scale = 1.5;
    var viewport = page.getViewport(scale);

    // Prepare canvas using PDF page dimensions
    var canvas = document.getElementById('disaster_canvas');
    var context = canvas.getContext('2d');
    canvas.height = viewport.height;
    canvas.width = viewport.width;

    // Render PDF page into canvas context
    var renderContext = { canvasContext: context, viewport: viewport };
    page.render(renderContext);
  });

  pdf.getPage(59).then(function(page) {
    var scale = 1.5;
    var viewport = page.getViewport(scale);

    // Prepare canvas using PDF page dimensions
    var canvas = document.getElementById('resilienza_canvas');
    var context = canvas.getContext('2d');
    canvas.height = viewport.height;
    canvas.width = viewport.width;

    // Render PDF page into canvas context
    var renderContext = { canvasContext: context, viewport: viewport };
    page.render(renderContext);
  });

  pdf.getPage(50).then(function(page) {
    var scale = 1.5;
    var viewport = page.getViewport(scale);

    // Prepare canvas using PDF page dimensions
    var canvas = document.getElementById('biodiversity_canvas');
    var context = canvas.getContext('2d');
    canvas.height = viewport.height;
    canvas.width = viewport.width;

    // Render PDF page into canvas context
    var renderContext = { canvasContext: context, viewport: viewport };
    page.render(renderContext);
  });

  pdf.getPage(63).then(function(page) {
    var scale = 1.5;
    var viewport = page.getViewport(scale);

    // Prepare canvas using PDF page dimensions
    var canvas = document.getElementById('water_canvas');
    var context = canvas.getContext('2d');
    canvas.height = viewport.height;
    canvas.width = viewport.width;

    // Render PDF page into canvas context
    var renderContext = { canvasContext: context, viewport: viewport };
    page.render(renderContext);
  });

  pdf.getPage(48).then(function(page) {
    var scale = 1.5;
    var viewport = page.getViewport(scale);

    // Prepare canvas using PDF page dimensions
    var canvas = document.getElementById('agriculture_canvas');
    var context = canvas.getContext('2d');
    canvas.height = viewport.height;
    canvas.width = viewport.width;

    // Render PDF page into canvas context
    var renderContext = { canvasContext: context, viewport: viewport };
    page.render(renderContext);
  });
});

PDFJS.getDocument('assets/pratiche.pdf').then(function(pdf) {
  pdf.getPage(19).then(function(page) {
    var scale = 1.5;
    var viewport = page.getViewport(scale);

    // Prepare canvas using PDF page dimensions
    var canvas = document.getElementById('agriculture_canvas2');
    var context = canvas.getContext('2d');
    canvas.height = viewport.height;
    canvas.width = viewport.width;

    // Render PDF page into canvas context
    var renderContext = { canvasContext: context, viewport: viewport };
    page.render(renderContext);
  });
});

PDFJS.getDocument('assets/brochure.pdf').then(function(pdf) {
  pdf.getPage(1).then(function(page) {
    var scale = 1.5;
    var viewport = page.getViewport(scale);

    // Prepare canvas using PDF page dimensions
    var canvas = document.getElementById('brochure_canvas');
    var context = canvas.getContext('2d');
    canvas.height = viewport.height;
    canvas.width = viewport.width;

    // Render PDF page into canvas context
    var renderContext = { canvasContext: context, viewport: viewport };
    page.render(renderContext);
  });
});

