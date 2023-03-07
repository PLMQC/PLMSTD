page 33000952 "Maint. ScheduleTemplate B2B"
{

    Caption = 'Maintenance ScheduleTemplate';
    PageType = List;
    SourceTable = "Maint. Schedule Template B2B";
    UsageCategory = Documents;
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Control1102154000)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'This Field Defines Code of Equipment';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'This Field Defines Description of Equipment';
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("MaintenanceScTemplate ")
            {
                ApplicationArea = ALL;
                ToolTip = 'Defines Maintenance Schedule Template.';
                Caption = 'MaintenanceScTemplate';
                Image = Calendar;

                trigger OnAction();
                begin
                    CLEAR(MaintenanceScheduleSetup);
                    MaintenanceScheduleSetup.SetTemplate(Rec.Code);
                    MaintenanceScheduleSetup.RUNMODAL();
                end;
            }
        }
    }

    var
        MaintenanceScheduleSetup: Page "Maintenance Schedule Setup B2B";
}

