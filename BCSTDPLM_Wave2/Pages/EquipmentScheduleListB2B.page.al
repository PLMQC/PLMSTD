page 33000988 "Equipment Schedule List B2B"
{

    Caption = 'Equipment Schedule List';
    Editable = false;
    PageType = List;
    SourceTable = "Equipment Schedule Line B2B";
    UsageCategory = Lists;
    ApplicationArea = all;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line Type"; Rec."Line Type")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Line type.';

                }
                field("Line Type Name"; Rec."Line Type Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Line name.';

                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Description.';

                }
                field("I/R Code"; Rec."I/R Code")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines I/R code.';

                }
                field("I/R Description"; Rec."I/R Description")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines I/R Description.';

                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Quantity.';

                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Unit Cost.';

                }
                field(UOM; Rec.UOM)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines UOM.';

                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Amount.';

                }
            }
        }
    }

    actions
    {
    }
}

