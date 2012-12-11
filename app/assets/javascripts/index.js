(function($){

  function populateData() {
    $.ajax({
      type: 'GET',
    dataType: 'json',
    url: '/gauges',
    success: function(data){

      $('.projects-container .project').each(function(index, item){
        $item = $(item);
        var gauge_id = $item.data('gauge-id');
        var result = _.find(data.gauges, function(gg){ return gg.id == gauge_id; });

        var html = result.today.views + '<span class="people">' + result.today.people + ' <i class="icon-group"></i></span>';
        $('.stat', $item).html(html);
      });
    }
    });
  }

  populateData();

  setInterval(function(){
    populateData();
    console.log('populated');
  }, 30000);

})(jQuery);
