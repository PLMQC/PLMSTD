page 33000973 "Equipment Specs List B2B"
{

    Caption = 'Equipment Specs List';
    PageType = List;
    SourceTable = "Equi. Specs List History B2B";
    UsageCategory = Lists;
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Control1102154000)
            {
                field("Machine ID"; Rec."Machine ID")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Machine ID.';

                }
                field("Machine Name"; Rec."Machine Name")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Machine Name.';

                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Code.';

                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Description.';

                }
                field(Status; Rec.Status)
                {
                    OptionCaption = '" ,Ok,Not Ok"';
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Status.';

                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines date.';

                }
                field("Last Modified Date"; Rec."Last Modified Date")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Last modiied date.';

                }
                field("Check List No."; Rec."Check List No.")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Checklist No.';

                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines User ID.';

                }
                field(Time; Rec.Time)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Time.';
                }
                field(Type; Rec.Type)
                {
                    OptionCaption = '" ,Specs,CheckList"';
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Type.';
                }
                field("Before Maintenance"; Rec."Before Maintenance")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Before Maintenance.';
                }
                field("After Maintenance"; Rec."After Maintenance")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines AfterMaintenance.';
                }
                field(Units; Rec.Units)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Units.';
                }
            }
        }
    }

    actions
    {
    }
}

