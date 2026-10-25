-- Домашнє завдання: SQL-практика. JOINs

/*

https://hannapylieva.notion.site/SQL-JOINs-1d594835849480e19eaac37639cc4c9b

Виконайте ці завдання на платформі sql-practice.com (https://sql-practice.com/),
використовуючи базу Northwind.

Завдання побудовані так, ніби ви працюєте аналітиком у компанії:
витягуєте потрібні дані зі зв'язків між таблицями.

Формат здачі:
- Google Doc або Notion-сторінка з завданням, розвʼязком і скріншотами результатів -
  те, що повернула база, так аби чітко було видно, що запит відпрацював коректно.

Запити виконано на локальній базі Northwind (PostgreSQL 17).

Примітка: локальна версія Northwind трохи відрізняється від бази на sql-practice.com:
  - у suppliers.region немає значень 'North America' / 'Western Europe' (там штати/провінції),
  - працівників найнято у 1992-1994 роках, а не у 2013.
Тому для завдань 3 і 9 наведено запит строго за умовою (на sql-practice.com він поверне дані)
та додатковий адаптований варіант, що показує роботу тієї ж логіки на локальних даних.

 */


-- ---------------------------------------------------------------------
-- 1. Виведіть список усіх замовлень з ID замовлення, іменем та прізвищем
--    працівника, який його обробив.
-- ---------------------------------------------------------------------

SELECT o.order_id
     , e.first_name
     , e.last_name
FROM orders AS o
JOIN employees AS e
  ON o.employee_id = e.employee_id
ORDER BY o.order_id
;

/* Результат:

 order_id | first_name | last_name 
----------+------------+-----------
    10248 | Steven     | Buchanan
    10249 | Michael    | Suyama
    10250 | Margaret   | Peacock
    10251 | Janet      | Leverling
    10252 | Margaret   | Peacock
    10253 | Janet      | Leverling
    10254 | Steven     | Buchanan
    10255 | Anne       | Dodsworth
    10256 | Janet      | Leverling
    10257 | Margaret   | Peacock
    10258 | Nancy      | Davolio
    10259 | Margaret   | Peacock
    10260 | Margaret   | Peacock
    10261 | Margaret   | Peacock
    10262 | Laura      | Callahan
    10263 | Anne       | Dodsworth
    10264 | Michael    | Suyama
    10265 | Andrew     | Fuller
    10266 | Janet      | Leverling
    10267 | Margaret   | Peacock
    10268 | Laura      | Callahan
    10269 | Steven     | Buchanan
    10270 | Nancy      | Davolio
    10271 | Michael    | Suyama
    10272 | Michael    | Suyama
    10273 | Janet      | Leverling
    10274 | Michael    | Suyama
    10275 | Nancy      | Davolio
    10276 | Laura      | Callahan
    10277 | Andrew     | Fuller
    10278 | Laura      | Callahan
    10279 | Laura      | Callahan
    10280 | Andrew     | Fuller
    10281 | Margaret   | Peacock
    10282 | Margaret   | Peacock
    10283 | Janet      | Leverling
    10284 | Margaret   | Peacock
    10285 | Nancy      | Davolio
    10286 | Laura      | Callahan
    10287 | Laura      | Callahan
    10288 | Margaret   | Peacock
    10289 | Robert     | King
    10290 | Laura      | Callahan
    10291 | Michael    | Suyama
    10292 | Nancy      | Davolio
    10293 | Nancy      | Davolio
    10294 | Margaret   | Peacock
    10295 | Andrew     | Fuller
    10296 | Michael    | Suyama
    10297 | Steven     | Buchanan
    10298 | Michael    | Suyama
    10299 | Margaret   | Peacock
    10300 | Andrew     | Fuller
    10301 | Laura      | Callahan
    10302 | Margaret   | Peacock
    10303 | Robert     | King
    10304 | Nancy      | Davolio
    10305 | Laura      | Callahan
    10306 | Nancy      | Davolio
    10307 | Andrew     | Fuller
    10308 | Robert     | King
    10309 | Janet      | Leverling
    10310 | Laura      | Callahan
    10311 | Nancy      | Davolio
    10312 | Andrew     | Fuller
    10313 | Andrew     | Fuller
    10314 | Nancy      | Davolio
    10315 | Margaret   | Peacock
    10316 | Nancy      | Davolio
    10317 | Michael    | Suyama
    10318 | Laura      | Callahan
    10319 | Robert     | King
    10320 | Steven     | Buchanan
    10321 | Janet      | Leverling
    10322 | Robert     | King
    10323 | Margaret   | Peacock
    10324 | Anne       | Dodsworth
    10325 | Nancy      | Davolio
    10326 | Margaret   | Peacock
    10327 | Andrew     | Fuller
    10328 | Margaret   | Peacock
    10329 | Margaret   | Peacock
    10330 | Janet      | Leverling
    10331 | Anne       | Dodsworth
    10332 | Janet      | Leverling
    10333 | Steven     | Buchanan
    10334 | Laura      | Callahan
    10335 | Robert     | King
    10336 | Robert     | King
    10337 | Margaret   | Peacock
    10338 | Margaret   | Peacock
    10339 | Andrew     | Fuller
    10340 | Nancy      | Davolio
    10341 | Robert     | King
    10342 | Margaret   | Peacock
    10343 | Margaret   | Peacock
    10344 | Margaret   | Peacock
    10345 | Andrew     | Fuller
    10346 | Janet      | Leverling
    10347 | Margaret   | Peacock
    10348 | Margaret   | Peacock
    10349 | Robert     | King
    10350 | Michael    | Suyama
    10351 | Nancy      | Davolio
    10352 | Janet      | Leverling
    10353 | Robert     | King
    10354 | Laura      | Callahan
    10355 | Michael    | Suyama
    10356 | Michael    | Suyama
    10357 | Nancy      | Davolio
    10358 | Steven     | Buchanan
    10359 | Steven     | Buchanan
    10360 | Margaret   | Peacock
    10361 | Nancy      | Davolio
    10362 | Janet      | Leverling
    10363 | Margaret   | Peacock
    10364 | Nancy      | Davolio
    10365 | Janet      | Leverling
    10366 | Laura      | Callahan
    10367 | Robert     | King
    10368 | Andrew     | Fuller
    10369 | Laura      | Callahan
    10370 | Michael    | Suyama
    10371 | Nancy      | Davolio
    10372 | Steven     | Buchanan
    10373 | Margaret   | Peacock
    10374 | Nancy      | Davolio
    10375 | Janet      | Leverling
    10376 | Nancy      | Davolio
    10377 | Nancy      | Davolio
    10378 | Steven     | Buchanan
    10379 | Andrew     | Fuller
    10380 | Laura      | Callahan
    10381 | Janet      | Leverling
    10382 | Margaret   | Peacock
    10383 | Laura      | Callahan
    10384 | Janet      | Leverling
    10385 | Nancy      | Davolio
    10386 | Anne       | Dodsworth
    10387 | Nancy      | Davolio
    10388 | Andrew     | Fuller
    10389 | Margaret   | Peacock
    10390 | Michael    | Suyama
    10391 | Janet      | Leverling
    10392 | Andrew     | Fuller
    10393 | Nancy      | Davolio
    10394 | Nancy      | Davolio
    10395 | Michael    | Suyama
    10396 | Nancy      | Davolio
    10397 | Steven     | Buchanan
    10398 | Andrew     | Fuller
    10399 | Laura      | Callahan
    10400 | Nancy      | Davolio
    10401 | Nancy      | Davolio
    10402 | Laura      | Callahan
    10403 | Margaret   | Peacock
    10404 | Andrew     | Fuller
    10405 | Nancy      | Davolio
    10406 | Robert     | King
    10407 | Andrew     | Fuller
    10408 | Laura      | Callahan
    10409 | Janet      | Leverling
    10410 | Janet      | Leverling
    10411 | Anne       | Dodsworth
    10412 | Laura      | Callahan
    10413 | Janet      | Leverling
    10414 | Andrew     | Fuller
    10415 | Janet      | Leverling
    10416 | Laura      | Callahan
    10417 | Margaret   | Peacock
    10418 | Margaret   | Peacock
    10419 | Margaret   | Peacock
    10420 | Janet      | Leverling
    10421 | Laura      | Callahan
    10422 | Andrew     | Fuller
    10423 | Michael    | Suyama
    10424 | Robert     | King
    10425 | Michael    | Suyama
    10426 | Margaret   | Peacock
    10427 | Margaret   | Peacock
    10428 | Robert     | King
    10429 | Janet      | Leverling
    10430 | Margaret   | Peacock
    10431 | Margaret   | Peacock
    10432 | Janet      | Leverling
    10433 | Janet      | Leverling
    10434 | Janet      | Leverling
    10435 | Laura      | Callahan
    10436 | Janet      | Leverling
    10437 | Laura      | Callahan
    10438 | Janet      | Leverling
    10439 | Michael    | Suyama
    10440 | Margaret   | Peacock
    10441 | Janet      | Leverling
    10442 | Janet      | Leverling
    10443 | Laura      | Callahan
    10444 | Janet      | Leverling
    10445 | Janet      | Leverling
    10446 | Michael    | Suyama
    10447 | Margaret   | Peacock
    10448 | Margaret   | Peacock
    10449 | Janet      | Leverling
    10450 | Laura      | Callahan
    10451 | Margaret   | Peacock
    10452 | Laura      | Callahan
    10453 | Nancy      | Davolio
    10454 | Margaret   | Peacock
    10455 | Laura      | Callahan
    10456 | Laura      | Callahan
    10457 | Andrew     | Fuller
    10458 | Robert     | King
    10459 | Margaret   | Peacock
    10460 | Laura      | Callahan
    10461 | Nancy      | Davolio
    10462 | Andrew     | Fuller
    10463 | Steven     | Buchanan
    10464 | Margaret   | Peacock
    10465 | Nancy      | Davolio
    10466 | Margaret   | Peacock
    10467 | Laura      | Callahan
    10468 | Janet      | Leverling
    10469 | Nancy      | Davolio
    10470 | Margaret   | Peacock
    10471 | Andrew     | Fuller
    10472 | Laura      | Callahan
    10473 | Nancy      | Davolio
    10474 | Steven     | Buchanan
    10475 | Anne       | Dodsworth
    10476 | Laura      | Callahan
    10477 | Steven     | Buchanan
    10478 | Andrew     | Fuller
    10479 | Janet      | Leverling
    10480 | Michael    | Suyama
    10481 | Laura      | Callahan
    10482 | Nancy      | Davolio
    10483 | Robert     | King
    10484 | Janet      | Leverling
    10485 | Margaret   | Peacock
    10486 | Nancy      | Davolio
    10487 | Andrew     | Fuller
    10488 | Laura      | Callahan
    10489 | Michael    | Suyama
    10490 | Robert     | King
    10491 | Laura      | Callahan
    10492 | Janet      | Leverling
    10493 | Margaret   | Peacock
    10494 | Margaret   | Peacock
    10495 | Janet      | Leverling
    10496 | Robert     | King
    10497 | Robert     | King
    10498 | Laura      | Callahan
    10499 | Margaret   | Peacock
    10500 | Michael    | Suyama
    10501 | Anne       | Dodsworth
    10502 | Andrew     | Fuller
    10503 | Michael    | Suyama
    10504 | Margaret   | Peacock
    10505 | Janet      | Leverling
    10506 | Anne       | Dodsworth
    10507 | Robert     | King
    10508 | Nancy      | Davolio
    10509 | Margaret   | Peacock
    10510 | Michael    | Suyama
    10511 | Margaret   | Peacock
    10512 | Robert     | King
    10513 | Robert     | King
    10514 | Janet      | Leverling
    10515 | Andrew     | Fuller
    10516 | Andrew     | Fuller
    10517 | Janet      | Leverling
    10518 | Margaret   | Peacock
    10519 | Michael    | Suyama
    10520 | Robert     | King
    10521 | Laura      | Callahan
    10522 | Margaret   | Peacock
    10523 | Robert     | King
    10524 | Nancy      | Davolio
    10525 | Nancy      | Davolio
    10526 | Margaret   | Peacock
    10527 | Robert     | King
    10528 | Michael    | Suyama
    10529 | Steven     | Buchanan
    10530 | Janet      | Leverling
    10531 | Robert     | King
    10532 | Robert     | King
    10533 | Laura      | Callahan
    10534 | Laura      | Callahan
    10535 | Margaret   | Peacock
    10536 | Janet      | Leverling
    10537 | Nancy      | Davolio
    10538 | Anne       | Dodsworth
    10539 | Michael    | Suyama
    10540 | Janet      | Leverling
    10541 | Andrew     | Fuller
    10542 | Nancy      | Davolio
    10543 | Laura      | Callahan
    10544 | Margaret   | Peacock
    10545 | Laura      | Callahan
    10546 | Nancy      | Davolio
    10547 | Janet      | Leverling
    10548 | Janet      | Leverling
    10549 | Steven     | Buchanan
    10550 | Robert     | King
    10551 | Margaret   | Peacock
    10552 | Andrew     | Fuller
    10553 | Andrew     | Fuller
    10554 | Margaret   | Peacock
    10555 | Michael    | Suyama
    10556 | Andrew     | Fuller
    10557 | Anne       | Dodsworth
    10558 | Nancy      | Davolio
    10559 | Michael    | Suyama
    10560 | Laura      | Callahan
    10561 | Andrew     | Fuller
    10562 | Nancy      | Davolio
    10563 | Andrew     | Fuller
    10564 | Margaret   | Peacock
    10565 | Laura      | Callahan
    10566 | Anne       | Dodsworth
    10567 | Nancy      | Davolio
    10568 | Janet      | Leverling
    10569 | Steven     | Buchanan
    10570 | Janet      | Leverling
    10571 | Laura      | Callahan
    10572 | Janet      | Leverling
    10573 | Robert     | King
    10574 | Margaret   | Peacock
    10575 | Steven     | Buchanan
    10576 | Janet      | Leverling
    10577 | Anne       | Dodsworth
    10578 | Margaret   | Peacock
    10579 | Nancy      | Davolio
    10580 | Margaret   | Peacock
    10581 | Janet      | Leverling
    10582 | Janet      | Leverling
    10583 | Andrew     | Fuller
    10584 | Margaret   | Peacock
    10585 | Robert     | King
    10586 | Anne       | Dodsworth
    10587 | Nancy      | Davolio
    10588 | Andrew     | Fuller
    10589 | Laura      | Callahan
    10590 | Margaret   | Peacock
    10591 | Nancy      | Davolio
    10592 | Janet      | Leverling
    10593 | Robert     | King
    10594 | Janet      | Leverling
    10595 | Andrew     | Fuller
    10596 | Laura      | Callahan
    10597 | Robert     | King
    10598 | Nancy      | Davolio
    10599 | Michael    | Suyama
    10600 | Margaret   | Peacock
    10601 | Robert     | King
    10602 | Laura      | Callahan
    10603 | Laura      | Callahan
    10604 | Nancy      | Davolio
    10605 | Nancy      | Davolio
    10606 | Margaret   | Peacock
    10607 | Steven     | Buchanan
    10608 | Margaret   | Peacock
    10609 | Robert     | King
    10610 | Laura      | Callahan
    10611 | Michael    | Suyama
    10612 | Nancy      | Davolio
    10613 | Margaret   | Peacock
    10614 | Laura      | Callahan
    10615 | Andrew     | Fuller
    10616 | Nancy      | Davolio
    10617 | Margaret   | Peacock
    10618 | Nancy      | Davolio
    10619 | Janet      | Leverling
    10620 | Andrew     | Fuller
    10621 | Margaret   | Peacock
    10622 | Margaret   | Peacock
    10623 | Laura      | Callahan
    10624 | Margaret   | Peacock
    10625 | Janet      | Leverling
    10626 | Nancy      | Davolio
    10627 | Laura      | Callahan
    10628 | Margaret   | Peacock
    10629 | Margaret   | Peacock
    10630 | Nancy      | Davolio
    10631 | Laura      | Callahan
    10632 | Laura      | Callahan
    10633 | Robert     | King
    10634 | Margaret   | Peacock
    10635 | Laura      | Callahan
    10636 | Margaret   | Peacock
    10637 | Michael    | Suyama
    10638 | Janet      | Leverling
    10639 | Robert     | King
    10640 | Margaret   | Peacock
    10641 | Margaret   | Peacock
    10642 | Robert     | King
    10643 | Michael    | Suyama
    10644 | Janet      | Leverling
    10645 | Margaret   | Peacock
    10646 | Anne       | Dodsworth
    10647 | Margaret   | Peacock
    10648 | Steven     | Buchanan
    10649 | Steven     | Buchanan
    10650 | Steven     | Buchanan
    10651 | Laura      | Callahan
    10652 | Margaret   | Peacock
    10653 | Nancy      | Davolio
    10654 | Steven     | Buchanan
    10655 | Nancy      | Davolio
    10656 | Michael    | Suyama
    10657 | Andrew     | Fuller
    10658 | Margaret   | Peacock
    10659 | Robert     | King
    10660 | Laura      | Callahan
    10661 | Robert     | King
    10662 | Janet      | Leverling
    10663 | Andrew     | Fuller
    10664 | Nancy      | Davolio
    10665 | Nancy      | Davolio
    10666 | Robert     | King
    10667 | Robert     | King
    10668 | Nancy      | Davolio
    10669 | Andrew     | Fuller
    10670 | Margaret   | Peacock
    10671 | Nancy      | Davolio
    10672 | Anne       | Dodsworth
    10673 | Andrew     | Fuller
    10674 | Margaret   | Peacock
    10675 | Steven     | Buchanan
    10676 | Andrew     | Fuller
    10677 | Nancy      | Davolio
    10678 | Robert     | King
    10679 | Laura      | Callahan
    10680 | Nancy      | Davolio
    10681 | Janet      | Leverling
    10682 | Janet      | Leverling
    10683 | Andrew     | Fuller
    10684 | Janet      | Leverling
    10685 | Margaret   | Peacock
    10686 | Andrew     | Fuller
    10687 | Anne       | Dodsworth
    10688 | Margaret   | Peacock
    10689 | Nancy      | Davolio
    10690 | Nancy      | Davolio
    10691 | Andrew     | Fuller
    10692 | Margaret   | Peacock
    10693 | Janet      | Leverling
    10694 | Laura      | Callahan
    10695 | Robert     | King
    10696 | Laura      | Callahan
    10697 | Janet      | Leverling
    10698 | Margaret   | Peacock
    10699 | Janet      | Leverling
    10700 | Janet      | Leverling
    10701 | Michael    | Suyama
    10702 | Margaret   | Peacock
    10703 | Michael    | Suyama
    10704 | Michael    | Suyama
    10705 | Anne       | Dodsworth
    10706 | Laura      | Callahan
    10707 | Margaret   | Peacock
    10708 | Michael    | Suyama
    10709 | Nancy      | Davolio
    10710 | Nancy      | Davolio
    10711 | Steven     | Buchanan
    10712 | Janet      | Leverling
    10713 | Nancy      | Davolio
    10714 | Steven     | Buchanan
    10715 | Janet      | Leverling
    10716 | Margaret   | Peacock
    10717 | Nancy      | Davolio
    10718 | Nancy      | Davolio
    10719 | Laura      | Callahan
    10720 | Laura      | Callahan
    10721 | Steven     | Buchanan
    10722 | Laura      | Callahan
    10723 | Janet      | Leverling
    10724 | Laura      | Callahan
    10725 | Margaret   | Peacock
    10726 | Margaret   | Peacock
    10727 | Andrew     | Fuller
    10728 | Margaret   | Peacock
    10729 | Laura      | Callahan
    10730 | Steven     | Buchanan
    10731 | Robert     | King
    10732 | Janet      | Leverling
    10733 | Nancy      | Davolio
    10734 | Andrew     | Fuller
    10735 | Michael    | Suyama
    10736 | Anne       | Dodsworth
    10737 | Andrew     | Fuller
    10738 | Andrew     | Fuller
    10739 | Janet      | Leverling
    10740 | Margaret   | Peacock
    10741 | Margaret   | Peacock
    10742 | Janet      | Leverling
    10743 | Nancy      | Davolio
    10744 | Michael    | Suyama
    10745 | Anne       | Dodsworth
    10746 | Nancy      | Davolio
    10747 | Michael    | Suyama
    10748 | Janet      | Leverling
    10749 | Margaret   | Peacock
    10750 | Anne       | Dodsworth
    10751 | Janet      | Leverling
    10752 | Andrew     | Fuller
    10753 | Janet      | Leverling
    10754 | Michael    | Suyama
    10755 | Margaret   | Peacock
    10756 | Laura      | Callahan
    10757 | Michael    | Suyama
    10758 | Janet      | Leverling
    10759 | Janet      | Leverling
    10760 | Margaret   | Peacock
    10761 | Steven     | Buchanan
    10762 | Janet      | Leverling
    10763 | Janet      | Leverling
    10764 | Michael    | Suyama
    10765 | Janet      | Leverling
    10766 | Margaret   | Peacock
    10767 | Margaret   | Peacock
    10768 | Janet      | Leverling
    10769 | Janet      | Leverling
    10770 | Laura      | Callahan
    10771 | Anne       | Dodsworth
    10772 | Janet      | Leverling
    10773 | Nancy      | Davolio
    10774 | Margaret   | Peacock
    10775 | Robert     | King
    10776 | Nancy      | Davolio
    10777 | Robert     | King
    10778 | Janet      | Leverling
    10779 | Janet      | Leverling
    10780 | Andrew     | Fuller
    10781 | Andrew     | Fuller
    10782 | Anne       | Dodsworth
    10783 | Margaret   | Peacock
    10784 | Margaret   | Peacock
    10785 | Nancy      | Davolio
    10786 | Laura      | Callahan
    10787 | Andrew     | Fuller
    10788 | Nancy      | Davolio
    10789 | Nancy      | Davolio
    10790 | Michael    | Suyama
    10791 | Michael    | Suyama
    10792 | Nancy      | Davolio
    10793 | Janet      | Leverling
    10794 | Michael    | Suyama
    10795 | Laura      | Callahan
    10796 | Janet      | Leverling
    10797 | Robert     | King
    10798 | Andrew     | Fuller
    10799 | Anne       | Dodsworth
    10800 | Nancy      | Davolio
    10801 | Margaret   | Peacock
    10802 | Margaret   | Peacock
    10803 | Margaret   | Peacock
    10804 | Michael    | Suyama
    10805 | Andrew     | Fuller
    10806 | Janet      | Leverling
    10807 | Margaret   | Peacock
    10808 | Andrew     | Fuller
    10809 | Robert     | King
    10810 | Andrew     | Fuller
    10811 | Laura      | Callahan
    10812 | Steven     | Buchanan
    10813 | Nancy      | Davolio
    10814 | Janet      | Leverling
    10815 | Andrew     | Fuller
    10816 | Margaret   | Peacock
    10817 | Janet      | Leverling
    10818 | Robert     | King
    10819 | Andrew     | Fuller
    10820 | Janet      | Leverling
    10821 | Nancy      | Davolio
    10822 | Michael    | Suyama
    10823 | Steven     | Buchanan
    10824 | Laura      | Callahan
    10825 | Nancy      | Davolio
    10826 | Michael    | Suyama
    10827 | Nancy      | Davolio
    10828 | Anne       | Dodsworth
    10829 | Anne       | Dodsworth
    10830 | Margaret   | Peacock
    10831 | Janet      | Leverling
    10832 | Andrew     | Fuller
    10833 | Michael    | Suyama
    10834 | Nancy      | Davolio
    10835 | Nancy      | Davolio
    10836 | Robert     | King
    10837 | Anne       | Dodsworth
    10838 | Janet      | Leverling
    10839 | Janet      | Leverling
    10840 | Margaret   | Peacock
    10841 | Steven     | Buchanan
    10842 | Nancy      | Davolio
    10843 | Margaret   | Peacock
    10844 | Laura      | Callahan
    10845 | Laura      | Callahan
    10846 | Andrew     | Fuller
    10847 | Margaret   | Peacock
    10848 | Robert     | King
    10849 | Anne       | Dodsworth
    10850 | Nancy      | Davolio
    10851 | Steven     | Buchanan
    10852 | Laura      | Callahan
    10853 | Anne       | Dodsworth
    10854 | Janet      | Leverling
    10855 | Janet      | Leverling
    10856 | Janet      | Leverling
    10857 | Laura      | Callahan
    10858 | Andrew     | Fuller
    10859 | Nancy      | Davolio
    10860 | Janet      | Leverling
    10861 | Margaret   | Peacock
    10862 | Laura      | Callahan
    10863 | Margaret   | Peacock
    10864 | Margaret   | Peacock
    10865 | Andrew     | Fuller
    10866 | Steven     | Buchanan
    10867 | Michael    | Suyama
    10868 | Robert     | King
    10869 | Steven     | Buchanan
    10870 | Steven     | Buchanan
    10871 | Anne       | Dodsworth
    10872 | Steven     | Buchanan
    10873 | Margaret   | Peacock
    10874 | Steven     | Buchanan
    10875 | Margaret   | Peacock
    10876 | Robert     | King
    10877 | Nancy      | Davolio
    10878 | Margaret   | Peacock
    10879 | Janet      | Leverling
    10880 | Robert     | King
    10881 | Margaret   | Peacock
    10882 | Margaret   | Peacock
    10883 | Laura      | Callahan
    10884 | Margaret   | Peacock
    10885 | Michael    | Suyama
    10886 | Nancy      | Davolio
    10887 | Laura      | Callahan
    10888 | Nancy      | Davolio
    10889 | Anne       | Dodsworth
    10890 | Robert     | King
    10891 | Robert     | King
    10892 | Margaret   | Peacock
    10893 | Anne       | Dodsworth
    10894 | Nancy      | Davolio
    10895 | Janet      | Leverling
    10896 | Robert     | King
    10897 | Janet      | Leverling
    10898 | Margaret   | Peacock
    10899 | Steven     | Buchanan
    10900 | Nancy      | Davolio
    10901 | Margaret   | Peacock
    10902 | Nancy      | Davolio
    10903 | Janet      | Leverling
    10904 | Janet      | Leverling
    10905 | Anne       | Dodsworth
    10906 | Margaret   | Peacock
    10907 | Michael    | Suyama
    10908 | Margaret   | Peacock
    10909 | Nancy      | Davolio
    10910 | Nancy      | Davolio
    10911 | Janet      | Leverling
    10912 | Andrew     | Fuller
    10913 | Margaret   | Peacock
    10914 | Michael    | Suyama
    10915 | Andrew     | Fuller
    10916 | Nancy      | Davolio
    10917 | Margaret   | Peacock
    10918 | Janet      | Leverling
    10919 | Andrew     | Fuller
    10920 | Margaret   | Peacock
    10921 | Nancy      | Davolio
    10922 | Steven     | Buchanan
    10923 | Robert     | King
    10924 | Janet      | Leverling
    10925 | Janet      | Leverling
    10926 | Margaret   | Peacock
    10927 | Margaret   | Peacock
    10928 | Nancy      | Davolio
    10929 | Michael    | Suyama
    10930 | Margaret   | Peacock
    10931 | Margaret   | Peacock
    10932 | Laura      | Callahan
    10933 | Michael    | Suyama
    10934 | Janet      | Leverling
    10935 | Margaret   | Peacock
    10936 | Janet      | Leverling
    10937 | Robert     | King
    10938 | Janet      | Leverling
    10939 | Andrew     | Fuller
    10940 | Laura      | Callahan
    10941 | Robert     | King
    10942 | Anne       | Dodsworth
    10943 | Margaret   | Peacock
    10944 | Michael    | Suyama
    10945 | Margaret   | Peacock
    10946 | Nancy      | Davolio
    10947 | Janet      | Leverling
    10948 | Janet      | Leverling
    10949 | Andrew     | Fuller
    10950 | Nancy      | Davolio
    10951 | Anne       | Dodsworth
    10952 | Nancy      | Davolio
    10953 | Anne       | Dodsworth
    10954 | Steven     | Buchanan
    10955 | Laura      | Callahan
    10956 | Michael    | Suyama
    10957 | Laura      | Callahan
    10958 | Robert     | King
    10959 | Michael    | Suyama
    10960 | Janet      | Leverling
    10961 | Laura      | Callahan
    10962 | Laura      | Callahan
    10963 | Anne       | Dodsworth
    10964 | Janet      | Leverling
    10965 | Michael    | Suyama
    10966 | Margaret   | Peacock
    10967 | Andrew     | Fuller
    10968 | Nancy      | Davolio
    10969 | Nancy      | Davolio
    10970 | Anne       | Dodsworth
    10971 | Andrew     | Fuller
    10972 | Margaret   | Peacock
    10973 | Michael    | Suyama
    10974 | Janet      | Leverling
    10975 | Nancy      | Davolio
    10976 | Nancy      | Davolio
    10977 | Laura      | Callahan
    10978 | Anne       | Dodsworth
    10979 | Laura      | Callahan
    10980 | Margaret   | Peacock
    10981 | Nancy      | Davolio
    10982 | Andrew     | Fuller
    10983 | Andrew     | Fuller
    10984 | Nancy      | Davolio
    10985 | Andrew     | Fuller
    10986 | Laura      | Callahan
    10987 | Laura      | Callahan
    10988 | Janet      | Leverling
    10989 | Andrew     | Fuller
    10990 | Andrew     | Fuller
    10991 | Nancy      | Davolio
    10992 | Nancy      | Davolio
    10993 | Robert     | King
    10994 | Andrew     | Fuller
    10995 | Nancy      | Davolio
    10996 | Margaret   | Peacock
    10997 | Laura      | Callahan
    10998 | Laura      | Callahan
    10999 | Michael    | Suyama
    11000 | Andrew     | Fuller
    11001 | Andrew     | Fuller
    11002 | Margaret   | Peacock
    11003 | Janet      | Leverling
    11004 | Janet      | Leverling
    11005 | Andrew     | Fuller
    11006 | Janet      | Leverling
    11007 | Laura      | Callahan
    11008 | Robert     | King
    11009 | Andrew     | Fuller
    11010 | Andrew     | Fuller
    11011 | Janet      | Leverling
    11012 | Nancy      | Davolio
    11013 | Andrew     | Fuller
    11014 | Andrew     | Fuller
    11015 | Andrew     | Fuller
    11016 | Anne       | Dodsworth
    11017 | Anne       | Dodsworth
    11018 | Margaret   | Peacock
    11019 | Michael    | Suyama
    11020 | Andrew     | Fuller
    11021 | Janet      | Leverling
    11022 | Anne       | Dodsworth
    11023 | Nancy      | Davolio
    11024 | Margaret   | Peacock
    11025 | Michael    | Suyama
    11026 | Margaret   | Peacock
    11027 | Nancy      | Davolio
    11028 | Andrew     | Fuller
    11029 | Margaret   | Peacock
    11030 | Robert     | King
    11031 | Michael    | Suyama
    11032 | Andrew     | Fuller
    11033 | Robert     | King
    11034 | Laura      | Callahan
    11035 | Andrew     | Fuller
    11036 | Laura      | Callahan
    11037 | Robert     | King
    11038 | Nancy      | Davolio
    11039 | Nancy      | Davolio
    11040 | Margaret   | Peacock
    11041 | Janet      | Leverling
    11042 | Andrew     | Fuller
    11043 | Steven     | Buchanan
    11044 | Margaret   | Peacock
    11045 | Michael    | Suyama
    11046 | Laura      | Callahan
    11047 | Robert     | King
    11048 | Robert     | King
    11049 | Janet      | Leverling
    11050 | Laura      | Callahan
    11051 | Robert     | King
    11052 | Janet      | Leverling
    11053 | Andrew     | Fuller
    11054 | Laura      | Callahan
    11055 | Robert     | King
    11056 | Laura      | Callahan
    11057 | Janet      | Leverling
    11058 | Anne       | Dodsworth
    11059 | Andrew     | Fuller
    11060 | Andrew     | Fuller
    11061 | Margaret   | Peacock
    11062 | Margaret   | Peacock
    11063 | Janet      | Leverling
    11064 | Nancy      | Davolio
    11065 | Laura      | Callahan
    11066 | Robert     | King
    11067 | Nancy      | Davolio
    11068 | Laura      | Callahan
    11069 | Nancy      | Davolio
    11070 | Andrew     | Fuller
    11071 | Nancy      | Davolio
    11072 | Margaret   | Peacock
    11073 | Andrew     | Fuller
    11074 | Robert     | King
    11075 | Laura      | Callahan
    11076 | Margaret   | Peacock
    11077 | Nancy      | Davolio
(830 rows)

*/


-- ---------------------------------------------------------------------
-- 2. Виведіть замовлення разом з датою, ID замовлення і назвою компанії клієнта.
--    Відфільтруйте лише замовлення, зроблені в жовтні. Відсортуйте за зростанням дати.
-- ---------------------------------------------------------------------

SELECT o.order_date
     , o.order_id
     , c.company_name
FROM orders AS o
JOIN customers AS c
  ON o.customer_id = c.customer_id
WHERE EXTRACT(MONTH FROM o.order_date) = 10
ORDER BY o.order_date ASC
;

/* Результат:

 order_date | order_id |          company_name          
------------+----------+--------------------------------
 1996-10-01 |    10318 | Island Trading
 1996-10-02 |    10319 | Tortuga Restaurante
 1996-10-03 |    10321 | Island Trading
 1996-10-03 |    10320 | Wartian Herkku
 1996-10-04 |    10322 | Pericles Comidas clásicas
 1996-10-07 |    10323 | Königlich Essen
 1996-10-08 |    10324 | Save-a-lot Markets
 1996-10-09 |    10325 | Königlich Essen
 1996-10-10 |    10326 | Bólido Comidas preparadas
 1996-10-11 |    10327 | Folk och fä HB
 1996-10-14 |    10328 | Furia Bacalhau e Frutos do Mar
 1996-10-15 |    10329 | Split Rail Beer & Ale
 1996-10-16 |    10330 | LILA-Supermercado
 1996-10-16 |    10331 | Bon app'
 1996-10-17 |    10332 | Mère Paillarde
 1996-10-18 |    10333 | Wartian Herkku
 1996-10-21 |    10334 | Victuailles en stock
 1996-10-22 |    10335 | Hungry Owl All-Night Grocers
 1996-10-23 |    10336 | Princesa Isabel Vinhos
 1996-10-24 |    10337 | Frankenversand
 1996-10-25 |    10338 | Old World Delicatessen
 1996-10-28 |    10339 | Mère Paillarde
 1996-10-29 |    10340 | Bon app'
 1996-10-29 |    10341 | Simons bistro
 1996-10-30 |    10342 | Frankenversand
 1996-10-31 |    10343 | Lehmanns Marktstand
 1997-10-01 |    10688 | Vaffeljernet
 1997-10-01 |    10689 | Berglunds snabbköp
 1997-10-02 |    10690 | Hanari Carnes
 1997-10-03 |    10692 | Alfreds Futterkiste
 1997-10-03 |    10691 | QUICK-Stop
 1997-10-06 |    10694 | QUICK-Stop
 1997-10-06 |    10693 | White Clover Markets
 1997-10-07 |    10695 | Wilman Kala
 1997-10-08 |    10696 | White Clover Markets
 1997-10-08 |    10697 | LINO-Delicateses
 1997-10-09 |    10698 | Ernst Handel
 1997-10-09 |    10699 | Morgenstern Gesundkost
 1997-10-10 |    10700 | Save-a-lot Markets
 1997-10-13 |    10702 | Alfreds Futterkiste
 1997-10-13 |    10701 | Hungry Owl All-Night Grocers
 1997-10-14 |    10703 | Folk och fä HB
 1997-10-14 |    10704 | Queen Cozinha
 1997-10-15 |    10705 | HILARION-Abastos
 1997-10-16 |    10707 | Around the Horn
 1997-10-16 |    10706 | Old World Delicatessen
 1997-10-17 |    10708 | The Big Cheese
 1997-10-17 |    10709 | Gourmet Lanchonetes
 1997-10-20 |    10710 | Franchi S.p.A.
 1997-10-21 |    10711 | Save-a-lot Markets
 1997-10-21 |    10712 | Hungry Owl All-Night Grocers
 1997-10-22 |    10713 | Save-a-lot Markets
 1997-10-22 |    10714 | Save-a-lot Markets
 1997-10-23 |    10715 | Bon app'
 1997-10-24 |    10716 | Rancho grande
 1997-10-24 |    10717 | Frankenversand
 1997-10-27 |    10719 | Let's Stop N Shop
 1997-10-27 |    10718 | Königlich Essen
 1997-10-28 |    10720 | Que Delícia
 1997-10-29 |    10721 | QUICK-Stop
 1997-10-29 |    10722 | Save-a-lot Markets
 1997-10-30 |    10724 | Mère Paillarde
 1997-10-30 |    10723 | White Clover Markets
 1997-10-31 |    10725 | Familia Arquibaldo
(64 rows)

*/


-- ---------------------------------------------------------------------
-- 3. Виведіть назви товарів разом з назвою постачальника та його регіоном,
--    але лише для тих постачальників, які знаходяться в регіонах "North America"
--    або "Western Europe". Відсортуйте результат за назвою постачальника
--    у зростаючому порядку.
-- ---------------------------------------------------------------------

-- Варіант 1: строго за умовою (для бази sql-practice.com)

SELECT p.product_name
     , s.company_name AS supplier_name
     , s.region
FROM products AS p
JOIN suppliers AS s
  ON p.supplier_id = s.supplier_id
WHERE s.region IN ('North America', 'Western Europe')
ORDER BY s.company_name ASC
;

/* Результат:

 product_name | supplier_name | region 
--------------+---------------+--------
(0 rows)


У локальній базі suppliers.region містить штати/провінції (OR, MA, Québec ...)
або NULL, тому запит повертає 0 рядків.
*/

-- Варіант 2: адаптація для локальної бази - регіон визначаємо за країною постачальника

SELECT p.product_name
     , s.company_name AS supplier_name
     , s.country
     , CASE
         WHEN s.country IN ('USA', 'Canada')                 THEN 'North America'
         WHEN s.country IN ('France', 'Germany', 'Netherlands') THEN 'Western Europe'
       END AS region
FROM products AS p
JOIN suppliers AS s
  ON p.supplier_id = s.supplier_id
WHERE s.country IN ('USA', 'Canada', 'France', 'Germany', 'Netherlands')
ORDER BY s.company_name ASC
       , p.product_name ASC
;

/* Результат:

           product_name           |             supplier_name              |   country   |     region     
----------------------------------+----------------------------------------+-------------+----------------
 Chartreuse verte                 | Aux joyeux ecclésiastiques             | France      | Western Europe
 Côte de Blaye                    | Aux joyeux ecclésiastiques             | France      | Western Europe
 Laughing Lumberjack Lager        | Bigfoot Breweries                      | USA         | North America
 Sasquatch Ale                    | Bigfoot Breweries                      | USA         | North America
 Steeleye Stout                   | Bigfoot Breweries                      | USA         | North America
 Escargots de Bourgogne           | Escargots Nouveaux                     | France      | Western Europe
 Sirop d'érable                   | Forêts d'érables                       | Canada      | North America
 Tarte au sucre                   | Forêts d'érables                       | Canada      | North America
 Camembert Pierrot                | Gai pâturage                           | France      | Western Europe
 Raclette Courdavault             | Gai pâturage                           | France      | Western Europe
 Grandma's Boysenberry Spread     | Grandma Kelly's Homestead              | USA         | North America
 Northwoods Cranberry Sauce       | Grandma Kelly's Homestead              | USA         | North America
 Uncle Bob's Organic Dried Pears  | Grandma Kelly's Homestead              | USA         | North America
 Gumbär Gummibärchen              | Heli Süßwaren GmbH & Co. KG            | Germany     | Western Europe
 NuNuCa Nuß-Nougat-Creme          | Heli Süßwaren GmbH & Co. KG            | Germany     | Western Europe
 Schoggi Schokolade               | Heli Süßwaren GmbH & Co. KG            | Germany     | Western Europe
 Pâté chinois                     | Ma Maison                              | Canada      | North America
 Tourtière                        | Ma Maison                              | Canada      | North America
 Boston Crab Meat                 | New England Seafood Cannery            | USA         | North America
 Jack's New England Clam Chowder  | New England Seafood Cannery            | USA         | North America
 Chef Anton's Cajun Seasoning     | New Orleans Cajun Delights             | USA         | North America
 Chef Anton's Gumbo Mix           | New Orleans Cajun Delights             | USA         | North America
 Louisiana Fiery Hot Pepper Sauce | New Orleans Cajun Delights             | USA         | North America
 Louisiana Hot Spiced Okra        | New Orleans Cajun Delights             | USA         | North America
 Nord-Ost Matjeshering            | Nord-Ost-Fisch Handelsgesellschaft mbH | Germany     | Western Europe
 Original Frankfurter grüne Soße  | Plutzer Lebensmittelgroßmärkte AG      | Germany     | Western Europe
 Rhönbräu Klosterbier             | Plutzer Lebensmittelgroßmärkte AG      | Germany     | Western Europe
 Rössle Sauerkraut                | Plutzer Lebensmittelgroßmärkte AG      | Germany     | Western Europe
 Thüringer Rostbratwurst          | Plutzer Lebensmittelgroßmärkte AG      | Germany     | Western Europe
 Wimmers gute Semmelknödel        | Plutzer Lebensmittelgroßmärkte AG      | Germany     | Western Europe
 Chocolade                        | Zaanse Snoepfabriek                    | Netherlands | Western Europe
 Zaanse koeken                    | Zaanse Snoepfabriek                    | Netherlands | Western Europe
(32 rows)

*/


-- ---------------------------------------------------------------------
-- 4. Виведіть список товарів, які коли-небудь були замовлені в магазині,
--    та для кожного товару виведіть:
--      - назву товару
--      - кількість замовлень, у яких цей товар зустрічається (n_orders)
--      - загальну кількість одиниць цього товару в усіх замовленнях (sum_quantity)
--    Відсортуйте результат за кількістю замовлень у зростаючому порядку.
-- ---------------------------------------------------------------------

SELECT p.product_name
     , COUNT(DISTINCT od.order_id) AS n_orders
     , SUM(od.quantity)            AS sum_quantity
FROM products AS p
JOIN order_details AS od
  ON p.product_id = od.product_id
GROUP BY p.product_id
       , p.product_name
ORDER BY n_orders ASC
       , p.product_name ASC
;

/* Результат:

           product_name           | n_orders | sum_quantity 
----------------------------------+----------+--------------
 Mishi Kobe Niku                  |        5 |           95
 Chocolade                        |        6 |          138
 Genen Shouyu                     |        6 |          122
 Gravad lax                       |        6 |          125
 Louisiana Hot Spiced Okra        |        8 |          239
 Schoggi Schokolade               |        9 |          365
 Chef Anton's Gumbo Mix           |       10 |          298
 Laughing Lumberjack Lager        |       10 |          184
 Valkoinen suklaa                 |       10 |          235
 Aniseed Syrup                    |       12 |          328
 Grandma's Boysenberry Spread     |       12 |          301
 Longlife Tofu                    |       13 |          297
 Northwoods Cranberry Sauce       |       13 |          372
 Gustaf's Knäckebröd              |       14 |          348
 Queso Manchego La Pastora        |       14 |          344
 Röd Kaviar                       |       14 |          293
 Rogede sild                      |       14 |          508
 Mascarpone Fabioli               |       15 |          297
 Sir Rodney's Marmalade           |       16 |          313
 Vegie-spread                     |       17 |          445
 Escargots de Bourgogne           |       18 |          534
 NuNuCa Nuß-Nougat-Creme          |       18 |          318
 Sasquatch Ale                    |       19 |          506
 Chef Anton's Cajun Seasoning     |       20 |          453
 Tunnbröd                         |       20 |          580
 Maxilaku                         |       21 |          520
 Zaanse koeken                    |       21 |          485
 Tofu                             |       22 |          404
 Ravioli Angelo                   |       23 |          434
 Côte de Blaye                    |       24 |          623
 Gula Malacca                     |       24 |          601
 Sirop d'érable                   |       24 |          603
 Carnarvon Tigers                 |       27 |          539
 Spegesild                        |       27 |          548
 Ipoh Coffee                      |       28 |          580
 Filo Mix                         |       29 |          500
 Uncle Bob's Organic Dried Pears  |       29 |          763
 Chartreuse verte                 |       30 |          793
 Perth Pasties                    |       30 |          722
 Singaporean Hokkien Fried Mee    |       30 |          697
 Wimmers gute Semmelknödel        |       30 |          740
 Gudbrandsdalsost                 |       31 |          714
 Inlagd Sill                      |       31 |          805
 Geitost                          |       32 |          755
 Gumbär Gummibärchen              |       32 |          753
 Louisiana Fiery Hot Pepper Sauce |       32 |          745
 Nord-Ost Matjeshering            |       32 |          612
 Thüringer Rostbratwurst          |       32 |          746
 Ikura                            |       33 |          742
 Pâté chinois                     |       33 |          903
 Rössle Sauerkraut                |       33 |          640
 Scottish Longbreads              |       34 |          799
 Steeleye Stout                   |       36 |          883
 Tourtière                        |       36 |          755
 Alice Mutton                     |       37 |          978
 Teatime Chocolate Biscuits       |       37 |          723
 Chai                             |       38 |          828
 Mozzarella di Giovanni           |       38 |          806
 Original Frankfurter grüne Soße  |       38 |          791
 Queso Cabrales                   |       38 |          706
 Lakkalikööri                     |       39 |          981
 Manjimup Dried Apples            |       39 |          886
 Outback Lager                    |       39 |          817
 Sir Rodney's Scones              |       39 |         1016
 Konbu                            |       40 |          891
 Boston Crab Meat                 |       41 |         1103
 Flotemysost                      |       42 |         1057
 Pavlova                          |       43 |         1158
 Chang                            |       44 |         1057
 Rhönbräu Klosterbier             |       46 |         1155
 Jack's New England Clam Chowder  |       47 |          981
 Tarte au sucre                   |       48 |         1083
 Gnocchi di nonna Alice           |       50 |         1263
 Camembert Pierrot                |       51 |         1577
 Gorgonzola Telino                |       51 |         1397
 Guaraná Fantástica               |       51 |         1125
 Raclette Courdavault             |       54 |         1496
(77 rows)

*/


-- ---------------------------------------------------------------------
-- 5. Знайдіть кількість замовлень для кожного клієнта. Виведіть назву клієнта,
--    кількість замовлень та відфільтруйте лише тих клієнтів, у кого замовлень більше 7.
-- ---------------------------------------------------------------------

SELECT c.company_name
     , COUNT(o.order_id) AS n_orders
FROM customers AS c
JOIN orders AS o
  ON c.customer_id = o.customer_id
GROUP BY c.customer_id
       , c.company_name
HAVING COUNT(o.order_id) > 7
ORDER BY n_orders DESC
       , c.company_name ASC
;

/* Результат:

          company_name          | n_orders 
--------------------------------+----------
 Save-a-lot Markets             |       31
 Ernst Handel                   |       30
 QUICK-Stop                     |       28
 Folk och fä HB                 |       19
 Hungry Owl All-Night Grocers   |       19
 Berglunds snabbköp             |       18
 HILARION-Abastos               |       18
 Rattlesnake Canyon Grocery     |       18
 Bon app'                       |       17
 Frankenversand                 |       15
 Lehmanns Marktstand            |       15
 Wartian Herkku                 |       15
 Bottom-Dollar Markets          |       14
 Hanari Carnes                  |       14
 Königlich Essen                |       14
 La maison d'Asie               |       14
 LILA-Supermercado              |       14
 White Clover Markets           |       14
 Around the Horn                |       13
 Mère Paillarde                 |       13
 Queen Cozinha                  |       13
 LINO-Delicateses               |       12
 Reggiani Caseifici             |       12
 Suprêmes délices               |       12
 Blondesddsl père et fils       |       11
 Great Lakes Food Market        |       11
 Ricardo Adocicados             |       11
 Vaffeljernet                   |       11
 B's Beverages                  |       10
 Die Wandernde Kuh              |       10
 Godos Cocina Típica            |       10
 Island Trading                 |       10
 Magazzini Alimentari Riuniti   |       10
 Old World Delicatessen         |       10
 Ottilies Käseladen             |       10
 Piccolo und mehr               |       10
 Richter Supermarkt             |       10
 Tortuga Restaurante            |       10
 Victuailles en stock           |       10
 Gourmet Lanchonetes            |        9
 Que Delícia                    |        9
 Seven Seas Imports             |        9
 Split Rail Beer & Ale          |        9
 Wellington Importadora         |        9
 Chop-suey Chinese              |        8
 Eastern Connection             |        8
 Furia Bacalhau e Frutos do Mar |        8
 Lonesome Pine Restaurant       |        8
(48 rows)

*/


-- ---------------------------------------------------------------------
-- 6. Виведіть імена та прізвища працівників, які працюють у територіях,
--    назва яких починається з "Santa". Використовуйте таблиці employees,
--    employee_territories та territories.
-- ---------------------------------------------------------------------

SELECT e.first_name
     , e.last_name
     , t.territory_description
FROM employees AS e
JOIN employee_territories AS et
  ON e.employee_id = et.employee_id
JOIN territories AS t
  ON et.territory_id = t.territory_id
WHERE t.territory_description LIKE 'Santa%'
ORDER BY e.last_name
       , e.first_name
;

/* Результат:

 first_name | last_name | territory_description 
------------+-----------+-----------------------
 Robert     | King      | Santa Monica
 Robert     | King      | Santa Clara
 Robert     | King      | Santa Cruz
(3 rows)

*/


-- ---------------------------------------------------------------------
-- 7. Виведіть товари з ціною понад 20 за одиницю разом із ціною на одиницю
--    і назвою постачальника.
-- ---------------------------------------------------------------------

SELECT p.product_name
     , p.unit_price
     , s.company_name AS supplier_name
FROM products AS p
JOIN suppliers AS s
  ON p.supplier_id = s.supplier_id
WHERE p.unit_price > 20
ORDER BY p.unit_price DESC
;

/* Результат:

           product_name           | unit_price |             supplier_name              
----------------------------------+------------+----------------------------------------
 Côte de Blaye                    |      263.5 | Aux joyeux ecclésiastiques
 Thüringer Rostbratwurst          |     123.79 | Plutzer Lebensmittelgroßmärkte AG
 Mishi Kobe Niku                  |         97 | Tokyo Traders
 Sir Rodney's Marmalade           |         81 | Specialty Biscuits, Ltd.
 Carnarvon Tigers                 |       62.5 | Pavlova, Ltd.
 Raclette Courdavault             |         55 | Gai pâturage
 Manjimup Dried Apples            |         53 | G'day, Mate
 Tarte au sucre                   |       49.3 | Forêts d'érables
 Ipoh Coffee                      |         46 | Leka Trading
 Rössle Sauerkraut                |       45.6 | Plutzer Lebensmittelgroßmärkte AG
 Schoggi Schokolade               |       43.9 | Heli Süßwaren GmbH & Co. KG
 Vegie-spread                     |       43.9 | Pavlova, Ltd.
 Northwoods Cranberry Sauce       |         40 | Grandma Kelly's Homestead
 Alice Mutton                     |         39 | Pavlova, Ltd.
 Queso Manchego La Pastora        |         38 | Cooperativa de Quesos 'Las Cabras'
 Gnocchi di nonna Alice           |         38 | Pasta Buttini s.r.l.
 Gudbrandsdalsost                 |         36 | Norske Meierier
 Mozzarella di Giovanni           |       34.8 | Formaggi Fortini s.r.l.
 Camembert Pierrot                |         34 | Gai pâturage
 Wimmers gute Semmelknödel        |      33.25 | Plutzer Lebensmittelgroßmärkte AG
 Perth Pasties                    |       32.8 | G'day, Mate
 Mascarpone Fabioli               |         32 | Formaggi Fortini s.r.l.
 Gumbär Gummibärchen              |      31.23 | Heli Süßwaren GmbH & Co. KG
 Ikura                            |         31 | Tokyo Traders
 Uncle Bob's Organic Dried Pears  |         30 | Grandma Kelly's Homestead
 Sirop d'érable                   |       28.5 | Forêts d'érables
 Gravad lax                       |         26 | Svensk Sjöföda AB
 Nord-Ost Matjeshering            |      25.89 | Nord-Ost-Fisch Handelsgesellschaft mbH
 Grandma's Boysenberry Spread     |         25 | Grandma Kelly's Homestead
 Pâté chinois                     |         24 | Ma Maison
 Tofu                             |      23.25 | Mayumi's
 Chef Anton's Cajun Seasoning     |         22 | New Orleans Cajun Delights
 Flotemysost                      |       21.5 | Norske Meierier
 Chef Anton's Gumbo Mix           |      21.35 | New Orleans Cajun Delights
 Louisiana Fiery Hot Pepper Sauce |      21.05 | New Orleans Cajun Delights
 Queso Cabrales                   |         21 | Cooperativa de Quesos 'Las Cabras'
 Gustaf's Knäckebröd              |         21 | PB Knäckebröd AB
(37 rows)

*/


-- ---------------------------------------------------------------------
-- 8. Виведіть категорії, в яких є більше ніж 5 товарів, і вкажіть кількість цих товарів.
-- ---------------------------------------------------------------------

SELECT c.category_name
     , COUNT(p.product_id) AS n_products
FROM categories AS c
JOIN products AS p
  ON c.category_id = p.category_id
GROUP BY c.category_id
       , c.category_name
HAVING COUNT(p.product_id) > 5
ORDER BY n_products DESC
;

/* Результат:

 category_name  | n_products 
----------------+------------
 Confections    |         13
 Condiments     |         12
 Beverages      |         12
 Seafood        |         12
 Dairy Products |         10
 Grains/Cereals |          7
 Meat/Poultry   |          6
(7 rows)

*/


-- ---------------------------------------------------------------------
-- 9. Виведіть імена, прізвища та дату найму працівників, які були найняті у 2013 році,
--    а також імена та прізвища їхніх керівників.
-- ---------------------------------------------------------------------

-- Self-join: таблиця employees зʼєднується сама з собою (e - працівник, m - керівник).
-- LEFT JOIN - щоб не втратити працівника без керівника (reports_to IS NULL).

-- Варіант 1: строго за умовою (для бази sql-practice.com)

SELECT e.first_name
     , e.last_name
     , e.hire_date
     , m.first_name AS manager_first_name
     , m.last_name  AS manager_last_name
FROM employees AS e
LEFT JOIN employees AS m
  ON e.reports_to = m.employee_id
WHERE EXTRACT(YEAR FROM e.hire_date) = 2013
ORDER BY e.hire_date
;

/* Результат:

 first_name | last_name | hire_date | manager_first_name | manager_last_name 
------------+-----------+-----------+--------------------+-------------------
(0 rows)


У локальній базі всіх працівників найнято у 1992-1994 роках, тому 0 рядків.
*/

-- Варіант 2: та сама логіка для 1993 року (локальна база)

SELECT e.first_name
     , e.last_name
     , e.hire_date
     , m.first_name AS manager_first_name
     , m.last_name  AS manager_last_name
FROM employees AS e
LEFT JOIN employees AS m
  ON e.reports_to = m.employee_id
WHERE EXTRACT(YEAR FROM e.hire_date) = 1993
ORDER BY e.hire_date
;

/* Результат:

 first_name | last_name | hire_date  | manager_first_name | manager_last_name 
------------+-----------+------------+--------------------+-------------------
 Margaret   | Peacock   | 1993-05-03 | Andrew             | Fuller
 Steven     | Buchanan  | 1993-10-17 | Andrew             | Fuller
 Michael    | Suyama    | 1993-10-17 | Steven             | Buchanan
(3 rows)

*/
