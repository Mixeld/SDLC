package AggregatorUI {
    private import ScalarValues::*;

    doc /* Структурные прототипы экранов агрегатора оповещений */

    part def Button {
        attribute label : String;
    }

    part def Filter {
        attribute label : String;
        attribute value : String;
    }

    part def AlertRow {
        attribute source : String;
        attribute alertType : String;
        attribute severity : String;
        attribute time : String;
        attribute description : String;
        attribute repeatCount : Integer;
        attribute acknowledged : Boolean;
    }

    part def SourceRow {
        attribute name : String;
        attribute sourceType : String;
        attribute pollIntervalSec : Integer;
        attribute enabled : Boolean;
        attribute status : String;
    }

    part def RuleRow {
        attribute condition : String;
        attribute severity : String;
    }

    part def NotificationPopup {
        attribute source : String;
        attribute description : String;
        part detailsButton : Button { :>> label = "Подробнее"; }
    }

    part def MainScreen {
        doc /* REQ-FUNC-005, REQ-FUNC-007, REQ-REL-008 */
        part sourceFilter : Filter { :>> label = "Источник"; :>> value = "Все"; }
        part severityFilter : Filter { :>> label = "Критичность"; :>> value = "Все"; }
        part hideAcknowledged : Filter { :>> label = "Скрыть подтверждённые"; :>> value = "Нет"; }
        part exampleAlert : AlertRow {
            :>> source = "Сервис API";
            :>> alertType = "Недоступность сервиса";
            :>> severity = "Критический";
            :>> time = "2026-11-04 12:30:15";
            :>> description = "Сервис не ответил за 10 с";
            :>> repeatCount = 3;
            :>> acknowledged = false;
        }
        part acknowledgeButton : Button { :>> label = "Подтвердить"; }
        part settingsButton : Button { :>> label = "Настройки"; }
        part sourceStatus : SourceRow {
            :>> name = "Погода";
            :>> sourceType = "Погода";
            :>> pollIntervalSec = 600;
            :>> enabled = true;
            :>> status = "Недоступен";
        }
        part notification : NotificationPopup {
            :>> source = "Сервис API";
            :>> description = "Сервис недоступен";
        }
    }

    part def SettingsScreen {
        doc /* REQ-FUNC-001, REQ-FUNC-004 */
        part exampleSource : SourceRow {
            :>> name = "Сервис API";
            :>> sourceType = "Сервис";
            :>> pollIntervalSec = 60;
            :>> enabled = true;
            :>> status = "Доступен";
        }
        part exampleRule : RuleRow {
            :>> condition = "Недоступность сервиса";
            :>> severity = "Критический";
        }
        part addSourceButton : Button { :>> label = "Добавить источник"; }
        part saveButton : Button { :>> label = "Сохранить"; }
    }

    part mainScreen : MainScreen;
    part settingsScreen : SettingsScreen;
}
