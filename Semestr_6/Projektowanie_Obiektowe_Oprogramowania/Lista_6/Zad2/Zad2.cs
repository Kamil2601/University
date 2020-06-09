using System;
using System.Collections.Generic;

namespace Zad2
{
    public class Context
    {
        Dictionary<string, bool> values = new Dictionary<string, bool>();

        public bool GetValue(string variableName)
        {
            if (values.ContainsKey(variableName))
            {
                return values[variableName];
            }
            else
            {
                throw new Exception("Uninitialized variable!");
            }
        }

        public void SetValue(string variableName, bool value)
        {
            values[variableName] = value;
        }
    }

    public abstract class AbstractExpression
    {
        public abstract bool Interpret(Context context);
    }

    public abstract class ConstExpression : AbstractExpression
    {}
    public abstract class BinaryExpression : AbstractExpression
    {
        protected AbstractExpression leftExpr, rightExpr;

        public BinaryExpression(AbstractExpression left, AbstractExpression right)
        {
            leftExpr = left;
            rightExpr = right;
        }
    }
    public abstract class UnaryExpression : AbstractExpression 
    {
        protected AbstractExpression expr;

        public UnaryExpression(AbstractExpression expr)
        {
            this.expr = expr;
        }
    }

    public class TrueExpression : ConstExpression
    {
        public override bool Interpret(Context context)
        {
            return true;
        }
    }

    public class FalseExpression : ConstExpression
    {
        public override bool Interpret(Context context)
        {
            return false;
        }
    }

    public class VarExpression : ConstExpression
    {
        string variable;
        public VarExpression(string var)
        {
            variable = var;
        }

        public override bool Interpret(Context context)
        {
            return context.GetValue(variable);
        }
    }

    public class NotExpression : UnaryExpression
    {
        public NotExpression(AbstractExpression expr) : base(expr) {}
        public override bool Interpret(Context context)
        {
            return !expr.Interpret(context);
        }
    }

    public class AndExpression : BinaryExpression
    {
        public AndExpression(AbstractExpression left, AbstractExpression right)
            : base(left,right) {}
        public override bool Interpret(Context context)
        {
            return leftExpr.Interpret(context) && rightExpr.Interpret(context);
        }
    }

    public class OrExpression : BinaryExpression
    {
        public OrExpression(AbstractExpression left, AbstractExpression right)
            : base(left,right) {}

        public override bool Interpret(Context context)
        {
            return leftExpr.Interpret(context) || rightExpr.Interpret(context);
        }
    }


    class Program
    {
        static void Main(string[] args)
        {
            Context ctx = new Context();
            ctx.SetValue( "x", false );
            ctx.SetValue( "y", true );

            AbstractExpression exp = new AndExpression(new VarExpression("x"),
                new VarExpression("y"));

            Console.WriteLine(exp.Interpret(ctx));

            AbstractExpression exp2 = new NotExpression(new TrueExpression());

            Console.WriteLine(exp2.Interpret(new Context()));
        }
    }
}