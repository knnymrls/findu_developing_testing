import 'user.dart';
import 'college.dart';

int calculateMatchScore(User user, College college) {
  double score = 0;
  int collegeACT = college.averageSAT ?? 0;

  // Admission Rate Compatibility (simplified)
  if (user.satScore >= collegeACT) {
    score += 50;
  }

  // College Size Compatibility
  // Use a default value (e.g., 0) if user.desiredCollegeSize or college.size is null.
  int userSize = user.desiredCollegeSize; // Default value if null
  int collegeSize = college.size ?? 0; // Default value if null
  int sizeDifference = (userSize - collegeSize).abs();

  int maxDifference = 10000; //
  double sizeScore = maxDifference - sizeDifference.toDouble();
  sizeScore = sizeScore.abs(); // Ensure score is not negative

  // Scale the size score to a maximum of 50 points
  score += (sizeScore / maxDifference) * 50;

  return score.round();
}
