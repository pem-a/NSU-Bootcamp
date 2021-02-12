# Annotate Enlistment 

For this activity you will annotate a simple plot to provide context. You will plot the number of enlistments of males under the age of 20 in the Army and in the Navy over time. Additionally, you will use `plt.annotate()` to mark the inflection point where enlistment of makes under 20 reached a peak and started declining.

## Instructions:

1. Place your annotation at the peak number of enlistments for males under the age of 20 by completing the following:

   - Using the Army array, compute the maximum number of males under the age of 20 who were enlisted into the Army.
   
   - Calculate the year in which the maximum number of males under the age of 20  were enlisted into the Army.
   
     - You will need to retrieve the index of the highest value in the Army array using `.argmax()`, and then use this value to index the year array.

4. Annotate the plot with a red arrow at the peak point identified in Step 1.

5. Label the arrow `Peak`. The parameter for this is a string, but you don’t need to specify it.

6. Pass in the arguments to `xy` and `xytext` as tuples.

7. For `xy`, use the `yr_max` and `army_max` values computed in Step 1.

8. For `xytext`, use `(yr_max+5, army_max+5)` to specify the displacement of the label from the tip of the arrow.

9. Draw the arrow by specifying the keyword argument `arrowprops=dict(facecolor='red')`. 

### Hints:

* See the [Matplotlib documentation for annotate](https://matplotlib.org/3.3.3/api/_as_gen/matplotlib.pyplot.annotate.html).

---

© 2021 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.