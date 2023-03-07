page 33000929 "Equi. PMR Schedule List B2B"
{

    Caption = 'Equipment PMR Schedule List';
    PageType = List;
    SourceTable = "Equipment PMR Schedule B2B";
    UsageCategory = Lists;
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Control1102154000)
            {
                Editable = false;
                field("Machine ID"; Rec."Machine ID")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Machine ID.';
                }
                field("Maintainance Schedule Part ID"; Rec."Maintainance Schedule Part ID")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Maintenance Schedule Part ID.';
                }
                field(Frequency; Rec.Frequency)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Frequency.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Date.';
                }
            }
        }
    }

    actions
    {
    }
}

