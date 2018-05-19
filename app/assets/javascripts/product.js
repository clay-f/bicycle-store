$(function() {
    clickNavigatorArrowRotateSuggestionList();
});

function clickNavigatorArrowRotateSuggestionList() {
    var navigagor_item = ["left_arrow", "right_arrow"];
    for (let i = 0; i <= navigagor_item.length - 1; i++) {
        $(`div#${navigagor_item[i]}`).on("click", () => {
                fetch("http://localhost:3000/products/suggestion_product")
                .then(response => 
                    response.json().then(body => ({data: body, status: response.status})))
                .then(data => {
                    generatorSuggestionListAppendToHtml(data.data, navigagor_item[i]);
                });
        });
    }
}

function generatorSuggestionListAppendToHtml(data, arrow_direct) {
    var animated_val = arrow_direct == "left_arrow" ? "fadeInLeft" : "fadeInRight";
    var suggestion_list =
        data.map((item) => {
            var html_val =
                `
                    <div class="col-2 guess_product_info animated ${animated_val}">
                        <figure class="figure">
                            <img src="/assets/${item.avatar}" class="img-thumbnail" height="100px" width="170px">
                            <span>${item.price}</span>
                        </figure>
                    </div>
                `;
            return html_val;
        });
        with($("div.suggest_products")) {
            children().filter("div.guess_product_info").remove();
            prepend(suggestion_list);
        }
}