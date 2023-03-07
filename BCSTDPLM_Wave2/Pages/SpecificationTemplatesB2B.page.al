page 33000940 "Specification Templates B2B"
{

    Caption = 'Specification Templates';
    PageType = List;
    SourceTable = "Specification Templates B2B";
    UsageCategory = Administration;
    ApplicationArea = all;
    layout
    {
        area(content)
        {
            repeater(Control1102154000)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Code.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Description.';
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Specification Template")
            {
                ApplicationArea = all;
                ToolTip = 'It Defines Specification template.';
                Caption = 'Specification Template';
                Image = SpecialOrder;

                trigger OnAction();
                begin
                    CLEAR(SpecificationTempsetup);
                    SpecificationTempsetup.SetTemplate(Rec.Code);
                    SpecificationTempsetup.RUNMODAL();
                end;
            }
        }
    }

    var
        SpecificationTempsetup: Page "Specification Temp Setup B2B";
}

