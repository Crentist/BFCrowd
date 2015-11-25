/*globals
    jQuery,
*/

var tutorial = (function ($) {

    'use strict';

    var ajaxUrl,
        $modal,
        currentPage,
        numPages,
        finished,
        onCloseCallback;

    function onHide() {
        $.ajax(ajaxUrl, {
            method: 'post',
            data: {
                'finished': finished,
            }
        });
        if (onCloseCallback !== null) {
            onCloseCallback();
        }
    }

    function setPage() {
        if (currentPage === 0) {
            $modal.find('.btn.previous').hide();
        } else {
            $modal.find('.btn.previous').show();
        }
        if (currentPage === numPages - 1) {
            $modal.find('.btn.next').hide();
            finished = true;
        } else {
            $modal.find('.btn.next').show();
        }
        var $page = $($modal.find('.pages .page')[currentPage]);
        $modal.find('.modal-title').text($page.find('h2').text());
        $page.find('h2').hide();
        $modal.find('.modal-body').html($page.html());

    }

    function nextPage() {
        currentPage += 1;
        setPage();
    }

    function previousPage() {
        if (currentPage === 0) {
            finished = false;
        } else {
            currentPage -= 1;
        }
        setPage();
    }


    function open(callback) {
        currentPage = 0;
        setPage();
        $modal.find('.btn.next').show();
        $modal.modal();
        finished = false;
        onCloseCallback = callback || null;
    }

    return {
        init: function () {
            //ajaxUrl = params.ajaxUrl;
            onCloseCallback = null;

            $modal = $('.tutorial.modal');
            numPages = $modal.find('.pages .page').length;
            $modal.on('hidden.bs.modal', onHide);
            $modal.on('closed.bs.modal', onHide);
            $modal.on('click', '.btn.next', nextPage);
            $modal.on('click', '.btn.previous', previousPage);
        },
        open: open,
    };

}(jQuery));