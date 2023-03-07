page 33000896 "Maint. Sched. Line List B2B"
{

    Caption = 'Maint. Sched. Line Proc. List';
    Editable = false;
    PageType = List;
    SourceTable = "Maint. Sched. Line Proc B2B";
    UsageCategory = Lists;
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            repeater(Control1102154000)
            {
                field("Machine ID"; Rec."Machine ID")
                {
                    ApplicationArea = all;
                    Tooltip = 'It Specifies the Machine ID.';
                }
                field("Machine Name"; Rec."Machine Name")
                {
                    ApplicationArea = all;
                    Tooltip = 'Against the Machine ID, Machine Name Appear.';

                }
                field("Step No."; Rec."Step No.")
                {
                    ApplicationArea = all;
                    Tooltip = 'Step No need to Specify here.';

                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                    Tooltip = 'It shows the Description.';

                }
                field("Special Tools"; Rec."Special Tools")
                {
                    ApplicationArea = all;
                    Tooltip = 'It Defines the Special tools.';

                }
            }
        }
    }

    actions
    {
    }
}

