var img_container = "/App_Firma/img/product/conf/small_icon";
var data_conf = new Array();
// Orientace ornamentu   Svislá 10/Vodorovná 20
data_conf["smer_skla"] = [{name: "Svislá" , hodnota: 10, pic: "ic-ver.png"}, {name: "Vodorovná" , hodnota: 20, pic: "ic-hor.png"}];
//Umístění ornamentu Vnitřní strana 10/Vnější strana 20
data_conf["ornament_skla"] = [{name: "Vnitřní" , hodnota: 10}, {name: "Vnější" , hodnota: 20}];
// Vnitřní frézování Ne 0/Ano 1
data_conf["vnitrni_frez"] = [{name: "Ano" , hodnota: 1}, {name: "Ne" , hodnota: 0}];
// Orientace let Svislá 10/Vodorovná 20
data_conf["smer_let"] = [{name: "Svislá" , hodnota: 10, pic: "ic-ver.png"}, {name: "Vodorovná" , hodnota: 20, pic: "ic-hor.png"}];
// Návaznost let   Ne 0/Ano 1
data_conf["navaznost_let"] = [{name: "Ne" , hodnota: 0}, {name: "Ano" , hodnota: 1}];
//Expres  Ne 0/Ano 1
data_conf["expres"] = [{name: "Ano" , hodnota: 1}, {name: "Ne" , hodnota: 0}];
//Dodatečná povrchová úprava    Bez povrchové úpravy 0/Patina 20/Vysoký lesk 90 (tady se mozna budou pridavat další)
data_conf["patina"] = [{popis: "Bez povrchové úpravy" , kod: 0}, {popis: "Patina" , kod: 20}, {popis: "Vysoký lesk" , kod: 90}];
var col_md_3 = ["grp_sklo", "kod_sklo", "smer_skla", "ornament_skla", "hrana_h", "hrana_d", "hrana_l", "kod_pantu", "vrtani", "kovani", "vyklop" ];
var checkboxColumn = [ "smer_let", "navaznost_let", "vnitrni_frez", "smer_skla", "ornament_skla"];
var filter = [ "kod_sklo", "grp_sklo", "smer_skla", "ornament_skla" ];
var column_set;

var labelName = new Array();
var email = "jiriz@zasgroup.cz";

var formatSelect = function (label) {
  $("#" + label).select2({
    placeholder: 'Vyberte možnost',
    minimumResultsForSearch: 8,
    width: 'resolve',
    theme: "foundation",
    language: "cs"
  });

};
var formatSelectOld = function (label) {

  // Select2
  function formatState(state) {
    if (!state.id) {
      return state.text;
    }
    var $state = $(
      '<span><img src="' + img_container + '/' + state.element.value.toLowerCase() + '.png" class="img-swatch" /> ' + state.text + '</span>'
    );
    return $state;
  };

  $(".select2-image").select2({
    placeholder: 'Vyberte možnost',
    minimumResultsForSearch: 8,
    width: 'resolve',
   // templateResult: formatState,
   // templateSelection: formatState,
    theme: "foundation",
    language: "cs"
  });

  $('.select2-simple').select2({
    placeholder: 'Vyberte možnost',
    minimumResultsForSearch: 8,
    theme: "foundation",
    language: "cs"
  });
}
var ajaxCall = function (data_send, getSelect) {

  $.ajax({
    url: "/ZasShopServicePage.aspx/",
    data: data_send,
    async: false,
    success(data) {
      data = JSON.parse(data);
      if(data.root.error_code) {
        console.debug(data.root.error_message);
        return false;
      } else {
        return getSelect(data.root);
      }
    },
    error(msg) {
      console.debug(msg);
    },
    complete() {

    }
  });
  
};
var configurator = {
  init: function () {

    let data_send = {n: 1, command: "GET_PRODUCT_CONF_COLS", cislo_nomenklatury: id_nomen};
    var getLabel = function(data) {
      var conf_cols = data.smako_conf_cols.column;
      for (var dataLabel in conf_cols) {
        labelName[conf_cols[dataLabel].column] = conf_cols[dataLabel].label;
      }
    }
    ajaxCall(data_send, getLabel);

    let data_send_folie = {n: 1, command: "GET_PRODUCT_CONF_FOLIE_SPEC", cislo_nomenklatury: id_nomen};
    var getFolieSpec = function(data) {
      data_conf["folie_spec"] = data.smako_conf_folie_spec.folie_spec;
    }
    ajaxCall(data_send_folie, getFolieSpec);


    let data_send_folie_zad = {n: 1, command: "GET_PRODUCT_CONF_ZADA_SPEC", cislo_nomenklatury: id_nomen};
    var getZadaSpec = function(data) {
      data_conf["zada_spec"] = data.smako_conf_folie_spec.folie_spec;
    }
    ajaxCall(data_send_folie_zad, getZadaSpec);

    configurator.getConf();
    //configurator.setConfig();
  },
  setConfig: function(){
    let data_send = {n: 1, command: "SET_PRODUCT_CONF",user_konf_id: "0", e_mail: email, cislo_nomenklatury: id_nomen, user_grp_folie: "DCFOL"};
    var getSelect = function(data) {
    }
    ajaxCall(data_send, getSelect);
  },
  getCheckboxTemplate: function(data, label_text) {
    var div = document.createElement("div");
    var legend = document.createElement("legend");
    legend.textContent = labelName["user_"+label_text];

    if(col_md_3.includes(label_text)) {
      div.setAttribute("class","col-md-3");
    } else {
      div.setAttribute("class","col-md-2");
    }

    div.appendChild(legend);
    if(data.length > 0){

      for(var setInput in data_conf[label_text]) {
        var input = document.createElement("INPUT");
        var label = document.createElement("label");
        var img = document.createElement("img");

        if( data_conf[label_text][setInput].pic ) {
          img.setAttribute("src", img_container + "/" + data_conf[label_text][setInput].pic );
          img.setAttribute("class", "option-icon");
          label.setAttribute("class", "withImg");
          label.appendChild(img);
        } else {
          label.textContent = data_conf[label_text][setInput].name;
        }

        label.setAttribute("for", data_conf[label_text][setInput].hodnota);
        label.setAttribute("class", label_text + "-" + data_conf[label_text][setInput].hodnota);
        input.setAttribute("type","radio");
        input.setAttribute("name", label_text );
        input.setAttribute("val", data_conf[label_text][setInput].hodnota );


        div.appendChild(input);
        div.appendChild(label);
      }

    }

    return div;

  },
  getDataSelect: function(label_text, filter) {

    var data = new Array;
    for (var filter_data in data_conf[label_text] ){

      if( data_conf[label_text][filter_data].kod_grp === filter) {
         data.push( data_conf[label_text][filter_data] );
      }
    }
      console.log(data);
  },
  getSelectTemplate: function (data, label_text) {
    data_conf[label_text] = data;
    var div = document.createElement("div");
    var select = document.createElement("SELECT");
    select.setAttribute("class", "select2-image");
    var label = document.createElement("Label");
    if(col_md_3.includes(label_text)) {
      div.setAttribute("class","col-md-3");
    } else {
      div.setAttribute("class","col-md-4");
    }
    select.setAttribute("id", label_text );
    label.textContent = labelName["user_"+label_text];
    div.appendChild(label);
    if( !label.textContent ){
      label.textContent = "user_"+label_text + "  -- chybí popisek";
    }

    div.appendChild(select);
    if(data === "disabled") {
      select.disabled;
    } else {
      if(data.length) {
        var option = document.createElement("option");
        select.appendChild(option);
        for (var x in data) {
          var option = document.createElement("option");
          option.value = data[x].kod;
          if(data[x].kod_grp) {
            option.setAttribute("data-filter", data[x].kod_grp);
          }
          option.innerHTML = data[x].popis;
          select.appendChild(option);
        }
      } else {
        var option = document.createElement("option");
        option.value = data.kod;
        option.innerHTML = data.popis;
        select.appendChild(option);
      }
    }


    return div;
  },
  getConf: function () {
    var template = "";
    let data_send = {n: 1, command: "GET_PRODUCT_CONF", cislo_nomenklatury: id_nomen};

    var getSelect = function(data) {

      var column = ["grp_folie", "kod_folie", "smer_let", "navaznost_let", "patina", "folie_spec", "", "grp_zada", "kod_zada", "", "", "zada_spec","", "sila", "kod_prov", "vnitrni_frez", "grp_skla", "kod_skla", "smer_skla", "ornament_skla", "hrana_h", "hrana_d", "hrana_l", "kod_pantu", "vrtani", "kovani", "vyklop"];

      $.each(column, function (i) {

        column_set = data["smako_conf_" + column[i]];

          if(checkboxColumn.includes(column[i])){
            template = configurator.getCheckboxTemplate( column[i], column[i]);
          } else if( column[i]=== "" ) {

            var div = document.createElement("div");
            div.setAttribute("class", "col-md-4 empty");
            template = div;

          } else {

            if(column_set === null) {
              template = configurator.getSelectTemplate("disabled", column[i]);
            } else if(column_set) {
              template = configurator.getSelectTemplate(column_set[column[i]], column[i]);
            } else {
              if(data_conf[column[i]]) {
                template = configurator.getSelectTemplate(data_conf[column[i]], column[i]);
              }
            }
          }

          $("#configurator_container").append(template);

          if(!checkboxColumn.includes(column[i])) {
            formatSelect(column[i]);
          }

      });

      $("select").change( function () {

        if( $(this).attr("data-filter") ) {
          var kod = $(this).val();
          $(this).parent("label").next("label").find("select option").each(function () {

            if( $(this).attr("data-filter") !== kod ) {
              $(this).attr("disabled","disabled");
              $(this).hide();
            } else {
              $(this).prop("disabled",false);
              $(this).show();
            }
          });

        }
      });

    };

    ajaxCall(data_send, getSelect);
  },
  setConf: function () {
    
  }
};

var detail = {
  init: function () {
    let data_send = {n: 1, command: "GET_PRODUCT_DETAIL", cislo_nomenklatury: id_nomen};
    var getImage = function (data) {

      var element = data.nomenklatura_detail;
      var file_data, template = "";
      if (element.file_items != null) {
        file_data = element.file_items.file_item;
      }

      for(var item in file_data) {

        var time = new Date(file_data[item].ts).getTime();
        var ts = ((time * 10000) + 621356040000000000);
        ts = ts.toString();
        var root = "/App_Firma/Data/Products/";

        var file_image = "";
        if (file_data[item].file_name) {
          file_image = root + file_data[item].pk + "_" + file_data[item].poradi + "_" + file_data[item].file_name.replace(".", "_") + "_" + ts + ".jpg";
          template += '<img src="' + file_image + '" />';

        }
      }

      $("#galleryDetail .slick-product").append(template);
      $("#galleryDetail .slick-nav").append(template);


    }
      ajaxCall(data_send, getImage);
  }
}

$(document).ready( function () {

  detail.init();
  configurator.init();

  $("select").change( function () {
    var val = $(this).val();

    if( $("[data-filter=" + val + "]").length ) {

     var id = $("[data-filter=" + val + "]").parent("select").attr("id");

     $("#"+ id).select2("destroy");

     $("#"+id + " option").each( function () {

       $(this).removeAttr("disabled");
       $(this).removeAttr("aria-disabled")

       if(val !== $(this).attr("data-filter")) {
         $(this).attr("disabled", "disabled");
         $(this).attr("aria-disabled", "true");
       }
     });

      formatSelect(id);

    }

  });

});