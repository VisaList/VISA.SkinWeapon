let AllCategorys = [];
let AllWeapons = [];
let AllSkins = [];
let CurrentSkin = 0;
let ImagePath = '';

function clickonmain(id) {
    var selectid = (id.substring(id.indexOf('-')));
    var id = selectid.substring(1);
    $.post('https://Selectweaponskin/action', JSON.stringify({
        action: "selectmain",
        id: id
    }));
}

function previewskin(id) {
    var selectid = (id.substring(id.indexOf('-')));
    var id = selectid.substring(1);
    $.post('https://Selectweaponskin/action', JSON.stringify({
        action: "preview",
        id: id
    }));
    CurrentSkin = id;
    $('.skin-list .list .item').removeClass('active');
    $(`#SkinId-${id}`).addClass('active');
    $.post('https://Selectweaponskin/action', JSON.stringify({
        action: "selectskin",
        id: CurrentSkin
    }));
}

$('#reset').on('click', function () {
    $.post('https://Selectweaponskin/action', JSON.stringify({
        action: "resetskin",
        id: CurrentSkin
    }));
});

category = function(e, name) {
    $('[cate]').hide();
    $('.category button').removeClass('active');
    $(`[cate="${name}"]`).show();
    $(e).addClass('active');
    $('.weapon-list .list .item').removeClass('active');
    $('.skin-list .list').empty();
};

window.addEventListener('message', function (event) {
    const data = event.data;

    if (data.action == 'openmenu') {
        AllWeapons = data.data;
        AllCategorys = data.cate;
        ImagePath = data.img;
        $('#wrapper').fadeIn();
        $('.weapon-list .list, .skin-list .list, .category').empty();
        $.each(data.data, function (i, weapon) {
            $('.weapon-list .list').append(`
                <div id="WeaponId-${i}" cate="${weapon.CATEGORY}" class="item" onclick="clickonmain(this.id)">
                    <div class="image">
                        <img src="${ImagePath}${weapon.MAIN}.png" alt="">
                    </div>
                    <div class="name">
                        ${weapon.NAME}
                    </div>
                </div>
            `);
        });
        $('[cate]').hide();

        $.each(data.cate, function (i, name) {
            $('.category').append(`
                <button onClick="category(this, '${name}')">
                    <span>${name}</span>
                </button>
            `);
        });

    } else if (data.action == 'selectmain') {
        AllSkins = data.data;
        CurrentSkin = 0;
        $('.skin-list .list').empty();
        $.each(data.data, function (i, weapon) {
            $('.skin-list .list').append(`
                <div id="SkinId-${i}" class="item" onclick="previewskin(this.id)">
                    <div class="image">
                        <img src="${ImagePath}${weapon.IMAGE}.png" alt="">
                    </div>
                    <div class="name">
                        ${weapon.SKINNAME}
                    </div>
                </div>
            `);
        });
        $('.weapon-list .list .item').removeClass('active');
        $(`#WeaponId-${data.select}`).addClass('active');
    } else if (data.action == 'closemenu') {
        $('#wrapper').fadeOut();
    };

});

$(document).ready(function () {
    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post('https://Selectweaponskin/action', JSON.stringify({
                action: "closemenu",
            }));
        }
    };
});



