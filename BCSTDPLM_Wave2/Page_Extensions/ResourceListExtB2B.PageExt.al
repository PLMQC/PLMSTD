pageextension 33000897 "Resource List Ext B2B" extends "Resource List"
{

    layout
    {
        addafter(Type)
        {
            field("Skill TypeB2B"; Rec."Skill Type B2B")
            {
                ApplicationArea = All;
                ToolTip = 'Skill Type is Specified Against the Skill of The Resource';
            }
            field("Global Dimension 1 CodeB2B"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = All;
                ToolTip = 'A Global Dimension is a dimension that you can use as a filter. Global Dimensions are Setup  in G/L Setup.';
            }
        }
    }

    //Unsupported feature: InsertAfter on "Documentation". Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

