page 33000946 "Equipment Status B2B"
{

    Caption = 'Equipment Status';
    PageType = List;
    SourceTable = "Equipment Status B2B";
    UsageCategory = Documents;
    ApplicationArea = all;
    layout
    {
        area(content)
        {
            repeater(Control1102154000)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Code.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines Desscription.';
                }
            }
        }
    }

    actions
    {
    }
}

